if [[ -d /usr/local/opt/chruby/share/chruby/ ]]; then

  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh

  # to set the default ruby to ruby 2:
  # echo "ruby-2" > ~/.ruby-version

  if [[ -n "$ZSH_VERSION" ]]; then
    if [[ "$preexec_functions" == *chruby_auto* ]] ; then
      if [[ "$preexec_functions" != *add_binstubs_path* ]] ; then
        preexec_functions+=("add_binstubs_path")
      fi
    fi
  fi

  function add_binstubs_path() {
    PATH=":$PATH:";
    PATH="${PATH//:$BINSTUBS_PATH:/:}";
    PATH="${PATH#:}"; PATH="${PATH%:}";
    PATH="$BINSTUBS_PATH:$PATH";
  }

fi
