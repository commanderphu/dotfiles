# ───────────────────────────────────────────────────────────────
# ⚡ Powerlevel10k - Flash Theme
# ───────────────────────────────────────────────────────────────

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  autoload -Uz is-at-least && is-at-least 5.1 || return

  # ─────────────────────────────────────────────────────────────
  # Flash Farben
  # ─────────────────────────────────────────────────────────────
  local bg='#1a0a0a'
  local gold='#f0c674'
  local gold_bright='#f0b800'
  local red='#cc2929'
  local red_bright='#ff4444'
  local red_dark='#5c1a1a'
  local white='#fffacd'
  local gray='#6a4a4a'

  # ─────────────────────────────────────────────────────────────
  # Prompt Layout
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate

  # Linke Prompt-Elemente
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon
    dir
    vcs
    prompt_char
  )

  # Rechte Prompt-Elemente
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    background_jobs
    node_version
    python_env
    time
  )

  # ─────────────────────────────────────────────────────────────
  # Allgemeine Einstellungen
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=' '
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL=' '

  # ─────────────────────────────────────────────────────────────
  # OS Icon - Flash Blitz
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=$red
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='⚡'

  # ─────────────────────────────────────────────────────────────
  # Directory
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=$gold_bright
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=$gold
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=$gold_bright
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=40
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3

  # Ordner Icons
  typeset -g POWERLEVEL9K_DIR_CLASSES=(
    '~/Dokumente/PhuDev(|/*)'  DEV     ''
    '~/Dokumente(|/*)'         DOCS    ''
    '~(|/*)'                   HOME    ''
    '*'                        DEFAULT ''
  )
  typeset -g POWERLEVEL9K_DIR_DEV_FOREGROUND=$gold_bright
  typeset -g POWERLEVEL9K_DIR_DOCS_FOREGROUND=$gold
  typeset -g POWERLEVEL9K_DIR_HOME_FOREGROUND=$gold_bright
  typeset -g POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=$gold

  # ─────────────────────────────────────────────────────────────
  # VCS (Git)
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$gold_bright
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$red_bright
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$red
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND=$red_bright
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=$gray

  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'

  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON='!'
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON='+'

  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='⇣'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='⇡'
  typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'
  typeset -g POWERLEVEL9K_VCS_TAG_ICON=''

  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)
  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1

  # ─────────────────────────────────────────────────────────────
  # Prompt Character
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$gold_bright
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$red_bright
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=

  # ─────────────────────────────────────────────────────────────
  # Status
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=$gold_bright
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=$gold_bright
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=$red_bright
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=$red_bright
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=$red_bright

  # ─────────────────────────────────────────────────────────────
  # Command Execution Time
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$gold
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='took '

  # ─────────────────────────────────────────────────────────────
  # Background Jobs
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=$gold

  # ─────────────────────────────────────────────────────────────
  # Node Version
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=$gold_bright
  typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true
  typeset -g POWERLEVEL9K_NODE_ICON=''

  # ─────────────────────────────────────────────────────────────
  # Python Environment
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_PYTHON_ICON=''
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$gold
  typeset -g POWERLEVEL9K_PYENV_FOREGROUND=$gold
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false

  # ─────────────────────────────────────────────────────────────
  # Time
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=$gray
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false
  typeset -g POWERLEVEL9K_TIME_PREFIX=''

  # ─────────────────────────────────────────────────────────────
  # Transient Prompt
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off

  # ─────────────────────────────────────────────────────────────
  # Instant Prompt
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  # ─────────────────────────────────────────────────────────────
  # Hot Reload
  # ─────────────────────────────────────────────────────────────
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
