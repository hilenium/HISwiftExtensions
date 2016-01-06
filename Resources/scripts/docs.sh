#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then
    echo -e "Generating docs \n"

    echo -e "Installing Jazzy \n"
    gem install jazzy

    # echo -e "Creating gh-pages dir \n"
    # mkdir gh-pages
    #
    # echo -e "Moving into gh-pages clone \n"
    # pushd gh-pages
    #
    # echo -e "Creating gh-pages repo \n"
    # git config --global user.email "travis@travis-ci.org"
    # git config --global user.name "travis-ci"

    echo -e "Generating documentation \n"
    jazzy --swift-version 2.1 --source-directory ../ --output .Resources/docs --podspec ../HISwiftExtensions.podspec

    echo -e "Adding new documentation \n"
    git add -A
    git commit -m "Updated docs from travis build $TRAVIS_BUILD_NUMBER"
    # git push --force --quiet "https://${GH_TOKEN}@github.com/hilenium/HISwiftExtensions" master:gh-pages > /dev/null 2>&1
    git subtree push --prefix Resources/docs origin gh-pages
    echo -e "Published latest docs.\n"

    echo -e "Finished..."
    popd
fi
