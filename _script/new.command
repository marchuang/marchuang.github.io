#!/bin/bash

echo "============================================================";
echo "------------------------marchuang41.github.io---------------";
echo "------------------------Marc.Huang-------------------- -----";
echo "------------------------2017.01.11A-------------------------";
echo "============================================================";

echo "Start to create post...";
echo "Enter filename (e.g. file-name-example):";
read filename
echo "Enter title:";
read title
echo "Enter author:";
read author

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
datetime="$(date +"%Y-%-m-%_d")";
filepath="$dir/../_posts/$datetime-$filename.md"

printf "%s\n" "---" >> $filepath
printf "layout: post\n" >> $filepath;
printf "title: %s\n" "\"$title\"" >> $filepath;
printf "author: %s\n" "$author" >> $filepath;
printf "%s\n\n\n" "---" >> $filepath
printf "## This is an example post\n" >> $filepath;
printf "%s highlight html %s\n" "{%" "%}" >> $filepath;
printf "console.log yourCodeHere\n" >> $filepath;
printf "%s endhighlight %s\n" "{%" "%}" >> $filepath;

printf "Html create successful in %s" $filepath;
printf "\n";

open $filepath
