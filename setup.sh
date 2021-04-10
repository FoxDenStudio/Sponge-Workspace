#!/usr/bin/env bash

pushd .. || exit 1

git clone --recursive git@github.com:SpongePowered/SpongeForge.git
git clone git@github.com:FoxDenStudio/FoxCore-Common.git
git clone git@github.com:FoxDenStudio/FoxGuard-Common.git
git clone git@github.com:FoxDenStudio/FoxCore-Sponge.git -b rewrite
#git clone git@github.com:FoxDenStudio/FoxGuard-Sponge.git -b $2

popd || exit 1

./redirect.bash || exit 1

cd ../SpongeForge || exit 1
./gradlew setupDecompWorkspace --refresh-dependencies

cd ../FoxCore-Sponge || exit 1
./gradlew setupDecompWorkspace --refresh-dependencies

