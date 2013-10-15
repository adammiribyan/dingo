if [[ ! -o interactive ]]; then
    return
fi

compctl -K _dingo dingo

_dingo() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(dingo commands)"
  else
    completions="$(dingo completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
