#!/usr/bin/env sh
cd .. || exit 1

workspace=$PWD

git clone git@github.com:SpongePowered/SpongeForge.git
git clone git@github.com:FoxDenStudio/FoxCore-Common.git
git clone git@github.com:FoxDenStudio/FoxGuard-Common.git
git clone git@github.com:FoxDenStudio/FoxCore-Sponge.git
git clone git@github.com:FoxDenStudio/FoxGuard-Sponge.git

cd $workspace

./redirect.bash

cd ../SpongeForge
./gradlew setupDecompWorkspace --refresh-dependencies
./gradlew genIntellijRuns

cd ../FoxCore-Sponge
./gradlew setupDecompWorkspace --refresh-dependencies

cd ..
cd $workspace
