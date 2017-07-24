#!/usr/local/bin bash

mergeBranch="master"
mergeSetting=$(git config --local sub.cleanup-merge)
delete_remote=
dry_run=

if [ ! -z "$mergeSetting" ]; then
  mergeBranch=$(echo "$mergeSetting")
fi
if [ ! -z "$1" ]; then
  mergeBranch="develop"
fi


while [ "$1" != "" ]; do
  PARAM="$1"
  case $PARAM in
        --remote)
            delete_remote=1
            ;;
        --dry-run | --dryrun)
            dry_run=1
            ;;
        *)
            ;;
  esac
  shift
done


if [ $(git rev-parse --verify --quiet "${mergeBranch}") ]; then

  if [ "$dry_run" ]; then
    git branch --merged "$mergeBranch" | grep -v '^ *master$' | grep -v 'develop$' | xargs -n 1 echo
  else
    git branch --merged "$mergeBranch" | grep -v '^ *master$' | grep -v 'develop$' | xargs -n 1 git branch -d
  fi

  #if [ "$delete_remote" ]; then

    #git_source="origin"
    #echo ${#git_source}
    #if [ "$dry_run" ]; then
    # echo "HUUUjdfjdkf dfakfja fakdfjaf " | cut -c ${#git_source}-
     #git branch --remote --merged "$mergeBrancH" | grep -v '^ *master$' | grep -v 'develop$' | cut -c ${#git_source}- #| xargs -n 1 echo 
    #exit 0
    #else
      #git branch --remote --merged "$mergeBranch" | grep -v '^ *master$' | grep -v 'develop$' | xargs -n 1 git push origin --delete 
    #fi

  #fi
else
  echo "Branch to check on merge with does not exist"
fi


#EOF
