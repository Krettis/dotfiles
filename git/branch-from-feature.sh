#!/usr/bin/env bash
# Get a carriage return into `cr` -- there *has* to be a better way to do this
cr=`echo $'\n.'`
cr=${cr%.}

current_branch=$(git rev-parse --abbrev-ref HEAD)
issue=$(git config sub.issue)

if [ "$current_branch" != "develop" ];then
  echo "please checkout develop"
  exit 1
fi

if [ -z "$issue" ]; then
  echo "issue does not exist"
  exit 1
fi
read -p "What is the issue number: ${cr}> " feature_issue_nr

# check if integer
if [ -z "$feature_issue_nr" ]; then # || ! [[ $feature_issue_nr =~ $re ]] ; then
  echo "Number is not valid"
  exit 1
fi

# check if already in local
feature_local=$(git branch --list | grep "feature/${issue}-${feature_issue_nr}")


if [ ! -z "$feature_local" ]; then 
  echo "Feature already exists"
  exit 1
fi

# create from jira
jira_result=$(jiracli -i "${issue}-${feature_issue_nr}"  --issue-oneline | cut -d ":" -f2 | cut -c 1-35 | cut -d "(" -f1 | sed 's/^[ \t]*//;s/[ \t]*$//')

#read -p "$cr ${cr}Give the title for this issue:${cr}> " -e -i "bladibla" feature_issue_title

if [ -z "$jira_result" ]; then
  exit 1
fi


feature_issue_title=$(echo "$jira_result" | tr '[:upper:]' '[:lower:]' | tr -s ' ' '-' | tr -s '--' '-')

if [ -z "$feature_issue_title" ]; then
  echo "Title is not valid: " $feature_issue_title
  exit 1
fi


branch_title="feature/${issue}-${feature_issue_nr}-${feature_issue_title}"

echo "\n\n"$branch_title

git checkout -b "$branch_title"