scoop update *
#scoop cleanup *
# Commenting out so I don't accidentally remove Python3.7
# This is because Vim is so far build with 3.7 DLLs and it will
# break any plugin that uses Python (e.g., UltiSnips).
# I have also changed my environment variables to point to the
# 3.7.4 distribution to avoid errors until things are updated.

bash /mnt/c/Users/Miles/scripts/update_vim_bundles.sh
