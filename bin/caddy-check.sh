#!/usr/bin/env bash
set -euo pipefail

UI_HOST=${UI_HOST:-ui.workmate.test}
API_HOST=${API_HOST:-api.workmate.test}
UI_URL="https://${UI_HOST}"
API_URL="https://${API_HOST}/docs"
LOG_LINES=${LOG_LINES:-80}

echo "=== 🧩 Caddy User-Service ==="
if systemctl --user is-active --quiet caddy; then
  echo "✅ caddy: active (running)"
else
  echo "❌ caddy NICHT aktiv"; systemctl --user status caddy --no-pager || true; exit 1
fi

echo -e "\n=== 🔐 Binary Capabilities ==="
if getcap "$(which caddy)" | grep -q 'cap_net_bind_service=ep'; then
  echo "✅ $(which caddy) hat cap_net_bind_service=ep"
else
  echo "❌ Capability fehlt: sudo setcap cap_net_bind_service=+ep \"$(which caddy)\""; exit 1
fi

echo -e "\n=== 🔊 Listener (80/443) ==="
if sudo ss -tulpn | grep -E ':(80|443)\b' | grep -qi caddy; then
  sudo ss -tulpn | grep -E ':(80|443)\b' | grep -i caddy || true
  echo "✅ Ports belegt von caddy"
else
  echo "❌ caddy lauscht nicht auf :80/:443"; exit 1
fi

echo -e "\n=== 📜 TLS-Zertifikat (UI) ==="
ISSUER_UI=$(echo | openssl s_client -connect "${UI_HOST}:443" -servername "${UI_HOST}" 2>/dev/null | openssl x509 -noout -issuer -subject -dates || true)
if grep -qi 'Caddy Local Authority' <<<"$ISSUER_UI"; then
  echo "✅ Issuer = Caddy Local Authority"
else
  echo "❌ Unerwarteter Issuer:"
  echo "$ISSUER_UI"; exit 1
fi

echo -e "\n=== 🌐 HTTP(S) Reachability ==="
set +e
curl -sS -o /dev/null -w "UI  %{{http_code}} %{{content_type}}\n"  "${UI_URL}"
curl -sS -o /dev/null -w "API %{{http_code}} %{{content_type}}\n" "${API_URL}"
RC=$?
set -e
if [[ $RC -ne 0 ]]; then
  echo "❌ HTTP-Checks fehlgeschlagen"; exit 1
fi

echo -e "\n=== 🧪 Mixed-Content Smoke (UI→API) ==="
# Erwartung: UI lädt per HTTPS; API-Aufruf darf KEIN :8000 enthalten
if rg -n "api\.workmate\.test:8000" -S ./ui 2>/dev/null; then
  echo "❌ Hardcodierter :8000 in ./ui gefunden."; exit 1
else
  echo "✅ Kein :8000 in ./ui"
fi

echo -e "\n=== 📚 Letzte Logs (caddy) ==="
journalctl --user -u caddy -n "${LOG_LINES}" --no-pager || true

echo -e "\n🎉 Alles gut."
