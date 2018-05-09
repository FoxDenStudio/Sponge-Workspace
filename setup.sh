#!/usr/bin/env sh

workspace=$PWD

cd .. || exit 1

git clone --recursive git@github.com:SpongePowered/SpongeForge.git
git clone git@github.com:FoxDenStudio/FoxCore-Common.git
git clone git@github.com:FoxDenStudio/FoxGuard-Common.git
git clone git@github.com:FoxDenStudio/FoxCore-Sponge.git
git clone git@github.com:FoxDenStudio/FoxGuard-Sponge.git

cd $workspace || exit 1

./redirect.bash || exit 1

cd ../SpongeForge || exit 1
./gradlew setupDecompWorkspace idea --refresh-dependencies
./gradlew genIntellijRuns

cd ../FoxCore-Sponge || exit 1
./gradlew setupDecompWorkspace idea --refresh-dependencies

cd .. || exit 1
cd $workspace || exit 1
