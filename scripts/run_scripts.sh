#!/bin/bash

(( TIMESTAMP_ACTION=$(date +%s) ))
(( TIMESTAMP_CHECK=$(date +%s) ))

inotifywait -r -m -e close_write,moved_to,create,modify -m /scripts |
while read path _ file; do
	[[ $file =~ ^.*lua$ ]] && {

        (( TIMESTAMP_CHECK=$(date +%s) ))

        if [[ $TIMESTAMP_CHECK -gt $TIMESTAMP_ACTION ]]; then
            (( TIMESTAMP_CHECK=$(date +%s) ))
            (( TIMESTAMP_ACTION=$(date +%s) + 3 ))
        	printf '********%-30s**************\n' "$file"
		echo '***************************'
		lua $path$file
        fi
	}
done

