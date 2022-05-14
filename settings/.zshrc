#######################################Base Config###############################################
export PATH=/Users/marcpicone/Library/Android/sdk/platform-tools:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
CASE_SENSITIVE="true"
plugins=(
  git
  brew
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

#######################################Global actions###############################################
alias lint="./gradlew ktlint"
alias format="./gradlew ktformat"
alias desktop="cd ~/Desktop"
alias documents="cd ~/Documents"

#######################################Git actions###############################################

##Basics
alias dev="git checkout dev"
alias co="git checkout"
alias add="git add ."
alias commitm="git commit -m"
alias am="git commit --am --no-edit"
alias pull="git pull"
alias push="git push"
alias pushf="git push -f"
alias rebd="git rebase dev"
alias rebase="git rebase"
alias continue="add && git rebase --continue"
alias st="git status"
alias stash="git stash"
alias pop="git stash pop"

##Specifics
alias prune="git fetch --prune"
alias gfix="git add . && git commit --am --no-edit && git push -f"
alias br="git branch"
alias brdel="git branch | grep -v \* | xargs git branch -D"
alias tag="git tag"
alias pulldev="dev && git pull"
alias pullmav="(cd /Users/marcpicone/Documents/maven && git pull)"
alias apkdebug="./gradlew assembleDebug"


##Particular cases
#Pro color
alias PCtranslate="./gradlew translate"

##Functions
function removeCommittedDirFromRemote(){

if [ $# -ne 1 ]; then
  echo "Usage: remove [folder name]"
  return
fi

git rm -r --cached "$1"
}

function removeCommittedFileFromRemote(){

if [ $# -ne 1 ]; then
  echo "Usage: remove [file name]"
  return
fi

git rm --cached "$1"
}

function mrm() {
  if [ $# -ne 2 ]; then
    echo "Usage: mr [branch_name] [commit_message]"
    return
  fi
  git add .
  git checkout -b "$1"
  git commit -m "$2"
  git push --set-upstream origin HEAD --push-option=merge_request.create --push-option=merge_request.label="mr::to-review"
}
