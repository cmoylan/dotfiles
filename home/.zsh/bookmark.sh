ZSH_BOOKMARKS="$HOME/.zsh/cdbookmarks"

function c_edit() {
  $EDITOR "$ZSH_BOOKMARKS"
}

function c() {
  local index
  local entry
  index=0
  for entry in $(echo "$1" | tr '/' '\n'); do
    if [[ $index == "0" ]]; then
      local CD
      CD=$(egrep "^$entry\\s" "$ZSH_BOOKMARKS" | sed "s#^$entry\\s\+##")
      if [ -z "$CD" ]; then
        echo "$0: no such bookmark: $entry"
        break
      else
        cd "$CD"
      fi
    else
      cd "$entry"
      if [ "$?" -ne "0" ]; then
        break
      fi
    fi
    let "index++"
  done
}

function _c() {
  reply=(`cat "$ZSH_BOOKMARKS" | sed -e 's#^\(.*\)\s.*$#\1#g'`)
}

compctl -K _c c
