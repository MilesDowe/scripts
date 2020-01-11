#!/bin/bash

BUNDLE_HOME='/mnt/c/Users/Miles/vimfiles/pack/plugins/start'

# Go to the bundle directory
cd ${BUNDLE_HOME}

# For each bundle, go in and update it's Git master repo
for BUNDLE in `ls .`; do
    echo "-> Updating ${BUNDLE}"
    (
        cd ${BUNDLE}

        # Note the branch we are using, remove uncommitted changes
        CURR_BRANCH=`git branch | grep "\*" | awk '{print $2}'`
        git checkout .

        # Checkout master and pull updates
        git checkout -q master
        git pull

        # If we weren't using master, go back to our old branch
        # and update it
        if [ ${CURR_BRANCH} != "master" ]; then
            echo "... Syncing local branch ${CURR_BRANCH} with master"
            git checkout -q ${CURR_BRANCH}
            git merge -q -m "Syncing with master" master
        fi
    )
    echo
done

