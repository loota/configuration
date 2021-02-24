#!/bin/sh
ctags -R --fields=+aimS --php-kinds=cdfint --languages=php --extras=+q --tag-relative=yes --exclude=".git" --exclude="vendor" \
--exclude="node_modules" --exclude="composer.phar" --totals=yes 
