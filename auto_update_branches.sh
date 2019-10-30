#!/bin/bash

BRANCHES=("sa_fb_sdk_update"
		"sa_dashboard_chimp_crash_fix"
		"sa_storage_crash_fix" 
		"sa_tooltip_fix"
		"sa_game_layer_crash_fix"
		"sa_iron_sources_updates")

echo "checking out master branch"

git checkout master
git pull origin master

for i in "${BRANCHES[@]}"
do
	echo "merging branch" $i " with master "
	git checkout $i
	git merge master --commit --no-edit
	git push
done

echo "checking out master branch back"
git checkout master