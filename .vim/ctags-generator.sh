#!/bin/bash
# creates tags from supplied directory.
# puts them in $HOME/.vim/mytags/supplied/directory/.
ctags -f ~/.vim/mytags/zend \
    -h ".php" -R \
    --exclude="\.svn" \
    --totals=yes \
    --tag-relative=yes \
    --PHP-kinds=+cf \
    --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
    --regex-PHP='/interface ([^ ]*)/\1/c/' \
    --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/'
