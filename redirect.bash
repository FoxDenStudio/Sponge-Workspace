#!/usr/bin/env bash
shopt -s nullglob
cd .. || exit 1
#if
#for project in Fox*/.git; do
#	project=${project%/.git}
#	echo "Pushing project:" $project
#	cd $project
#	git push
#done
for project in Fox*/.git; do
	project=${project%/.git}
	echo "project:" $project
	cd $project || exit 1
	git submodule init
	git submodule sync

	for submodule in ?*/.git; do
		submodule=${submodule%/.git}
		if [ -d "../$submodule/.git" ]; then
			echo "  submodule:" $submodule
			cd $submodule || exit 1
			#pwd
			content="gitdir: ../../$submodule/.git"
			echo $content > .git
			git reset --hard HEAD
			git clean -fd
			cd ..
		fi
	done
	cd ..
done
echo "Finished configuring and redirecting submodules"
