#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then
    echo -e "Generating docs \n"
    echo -e "Installing Jazzy \n"
    gem install jazzy
    echo -e "Generating documentation \n"
    jazzy --swift-version 2.1 --source-directory ./ --output .Resources/docs --podspec ./HISwiftExtensions.podspec
    echo -e "Adding new documentation \n"
    git add -A
    git commit -m "Updated docs from travis build $TRAVIS_BUILD_NUMBER"
    echo -e "Creating docs subtree \n"
    git add Resources/docs
    git subtree push --prefix Resources/docs origin gh-pages
    echo -e "Published latest docs.\n"
fi