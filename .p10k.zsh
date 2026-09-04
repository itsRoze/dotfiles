# Powerlevel10k — classic two-line prompt in Everforest colors.

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases' ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob' ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  local charcoal='#333c43'
  local cream='#d3c6aa'
  local sage='#a7c080'
  local gold='#dbbc7f'
  local salmon='#e67e80'
  local blue_green='#7fbbb3'
  local purple='#d699b6'
  local muted='#7a8478'

  # Preserve the original Pure-style rhythm: context above, command below.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    dir
    vcs
    newline
    prompt_char
  )
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    command_execution_time
    virtualenv
    context
    time
    newline
  )

  typeset -g POWERLEVEL9K_BACKGROUND=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR='  '
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # The original magenta chevron, translated into Everforest.
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=$purple
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=$salmon
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_{VICMD,VIVIS}_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=false

  # Cool directory color keeps the familiar cyan-over-magenta relationship.
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=$blue_green
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=$blue_green
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=false
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=$muted
  typeset -g POWERLEVEL9K_DIR_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER='…/'
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=48

  # Git: sage when clean, salmon when attention is required.
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$sage
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$salmon
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$salmon
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND=$salmon
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=$muted
  typeset -g POWERLEVEL9K_VCS_LOADING_TEXT=
  typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0
  typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind)
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED}_ICON=
  typeset -g POWERLEVEL9K_VCS_DIRTY_ICON='*'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=':⇣'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=':⇡'
  typeset -g POWERLEVEL9K_VCS_{INCOMING,OUTGOING}_CHANGESFORMAT_FOREGROUND=$blue_green
  typeset -g POWERLEVEL9K_VCS_{COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=1
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${${${P9K_CONTENT/⇣* :⇡/⇣⇡}// }//:/ }'

  # Context appears only when it carries information: SSH, root, or sudo.
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE="%F{$salmon}%n%f%F{$muted}@%m%f"
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE="%F{$muted}%n@%m%f"
  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_CONTENT_EXPANSION=

  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$muted
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=5
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$gold

  # Dim wall clock at the far right, as in the original prompt.
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=$muted
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%I:%M:%S %p}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  # Keep full historical prompts and their whitespace in scrollback.
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}
(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
