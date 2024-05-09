#! /bin/bash

printErrorAndExit()
{
  tput setaf 1; echo "$1"; tput sgr0
  exit
}

# shellcheck disable=SC2162
read -p "Project name: " projectName
if [ "$projectName" == '' ]; then
    printErrorAndExit "You must provide Project name!"
    exit
  elif [ ! -d "src/$projectName" ]; then
    printErrorAndExit "'$projectName' does not exist in 'src' folder!"
    exit
fi

# shellcheck disable=SC2162
read -p "PHP version: [82] " phpVersion
phpVersion=${phpVersion:-82}

tput setaf 2; echo "Running Docker for $projectName with PHP v.$phpVersion"; tput sgr0
export PROJECT_DIR=$projectName
export PHP_VERSION=$phpVersion

docker compose up -d