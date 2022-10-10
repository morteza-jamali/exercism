#!/usr/bin/env bash

ROOT_PATH=$(realpath $(dirname $(dirname "$0")))
WORKSPACE="$(exercism workspace)"
ARGS=${*:2}
run_command="$1 ${ARGS[@]}"

download() {
  local arg_key=
  local arg_value=
  local track=
  local exercise=
  local args=()

  while [ "$#" -gt 0 ]; do
    arg_key=$(echo $1 | cut -d '=' -f 1)
    arg_value=$(echo $1 | cut -d '=' -f 2)

    case "$arg_key" in
      "--exercise" | "-e")
        exercise="$arg_value"

        shift
      ;;
      "--track" | "-t")
        track="$arg_value"

        shift
      ;;
      *)
        args+=("$1")

        shift
      ;;
    esac
  done

  local exercise_path="$ROOT_PATH/src/$track/$exercise"

  if [ -d "$exercise_path" ]; then
    echo ">> ERROR  :: exercise '$exercise' from track '$track' already downloaded."
    exit 1
  fi

  exercism download --exercise=$exercise --track=$track ${args[@]} &> /dev/null
  cp -rf "$WORKSPACE/$track/$exercise" "$exercise_path"
  echo ">> SUCCESS:: exercise '$exercise' from track '$track' downloaded."
}

submit() {
  local arg_key=
  local arg_value=
  local track=
  local exercise=
  local file=
  local args=()

  while [ "$#" -gt 0 ]; do
    arg_key=$(echo $1 | cut -d '=' -f 1)
    arg_value=$(echo $1 | cut -d '=' -f 2)

    case "$arg_key" in
      "--exercise" | "-e")
        exercise="$arg_value"

        shift
      ;;
      "--track" | "-t")
        track="$arg_value"

        shift
      ;;
      "--file" | "-f")
        file="$arg_value"

        shift
      ;;
      *)
        args+=("$1")

        shift
      ;;
    esac
  done

  if [ -z "$file" ]; then
    echo ">> ERROR  :: option '--file' is required."
    exit 1
  fi

  if [ -z "$exercise" ]; then
    echo ">> ERROR  :: option '--exercise' is required."
    exit 1
  fi

  if [ -z "$track" ]; then
    echo ">> ERROR  :: option '--track' is required."
    exit 1
  fi

  local exercise_path="$ROOT_PATH/src/$track/$exercise"

  if [ ! -f "$exercise_path/$file" ]; then
    echo ">> ERROR  :: file '$file' doesn't exist."
    exit 1
  fi

  cp -rf "$exercise_path" "$WORKSPACE/$track/$exercise"
  (
    cd "$WORKSPACE/$track/$exercise"
    exercism submit $file ${args[@]}
  ) &&
  echo ">> SUCCESS:: exercise '$exercise' from track '$track' submited."
}

if [[ $1 = __* ]]; then
  echo ">> ERROR  :: argument '$1' is invalid."
  exit 1
fi

if [ "$(type -t $1 2> /dev/null)" != 'function' ]; then
  run_command="exercism $run_command"
fi

$run_command
