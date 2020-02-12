#!/bin/bash

# Colored headers
print_header () {
    /bin/echo -e "-> \e[1;33m${1}\e[0m"
}

BUNDLE_HOME='/mnt/c/Users/Miles/vimfiles/pack/plugins/start'

# Go to the bundle directory
cd ${BUNDLE_HOME} || exit

# For each bundle, go in and update it's Git master repo
BUNDLES=$(ls .)

for BUNDLE in ${BUNDLES}; do
    print_header "Updating ${BUNDLE}"
    (
        cd "${BUNDLE}" || exit

        # Note the branch we are using, remove uncommitted changes
        CURR_BRANCH=$(git branch | grep "\*" | awk '{print $2}')
        git checkout .

        # Checkout master and pull updates
        git checkout -q master
        git pull

        # If we weren't using master, go back to our old branch
        # and update it
        if [ "${CURR_BRANCH}" != "master" ]; then
            echo "... Syncing local branch ${CURR_BRANCH} with master"
            git checkout -q "${CURR_BRANCH}"
            git merge -q -m "Syncing with master" master
        fi
    )
    echo
done

