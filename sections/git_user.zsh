SPACESHIP_GITUSER_SHOW="${SPACESHIP_GITUSER_SHOW=true}"
SPACESHIP_GITUSER_PREFIX="${SPACESHIP_GITUSER_PREFIX="with "}"
SPACESHIP_GITUSER_SUFFIX="${SPACESHIP_GITUSER_SUFFIX=" "}"

spaceship_git_user() {
  [[ $SPACESHIP_GITUSER_SHOW == false ]] && return
  spaceship::is_git || return

  local username

  username="$(git config user.name)"
  [[ ! -z $username ]]|| return

  if [[ -n $username ]]; then
    spaceship::section \
      "magenta" \
      "$SPACESHIP_GITUSER_PREFIX" \
      "$username" \
      "$SPACESHIP_GITUSER_SUFFIX"
  fi
}