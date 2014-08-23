exclude_patterns() {
  exclude="-false" # need to start the list somewhere so we have the right number of "-or"

  for exclude_folder in '.git' '.bundle' 'tmp' 'log'; do
    exclude="$exclude -or -name $exclude_folder -prune"
  done

  # hm, time to switch to whitelist?
  for exclude_file in 'Gemfile.lock' 'structure.sql' '*.gif' '*.jpg' '*.png' '*jquery*' '*.doc' '*.pdf' '*.zip' '*.ico' '*.swf' '*.sqlite' '*.ttf' '*.csv' '*.otf' '*.svg' '*.woff' '*.ai' '*.eps' '*.psd' '*.xlsx'; do
    exclude="$exclude -or -iname $exclude_file"
  done

  echo $exclude
}

code_file_list() {
  find "${@:-.}" -not \( $(exclude_patterns) \) -type f -print0
}

normalise_files() {
  while IFS= read -d $'\0' -r file; do
    # `` strips all EOF newlines, printf straight echoes the file
    # line endings: tr
      # \r\n => \n for Win
      # \r => \n for Mac
    # whitespace & newline at EOF: sed
    # tabs -> 2 spaces: expand
    echo $file
    printf '%s' "`cat $file`" | tr '\r\n' '\n' | tr '\r' '\n' | sed -E 's/[[:blank:]]+$//' | expand -t 2 > "$file.tmp"
    mv "$file.tmp" "$file"
  done < <(code_file_list $@)

  if [[ -d "./script" ]]; then
    chmod +x script/*
  fi

  if [[ -d "./bin" ]]; then
    chmod +x bin/*
  fi
}
