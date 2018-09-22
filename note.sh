#!/bin/bash

TITLE=""

if [ -z "$1" ] ; then
	echo "Usage: note [title]"
	exit 0
fi

if [ $1 == "-l" ] ; then
	NOTES=$(osascript list_notes.scpt)
	echo "$NOTES"
	exit 0

elif [ $1 == "-i" ] ; then
	if [ -z "$2" ] ; then
		echo "Usage: note -i [index]"
		exit 0
	fi
	
	TITLE=$(osascript get_note_title_by_index.scpt $2)
	
	if [ -z "$TITLE" ] ; then 
		echo "Note not found"
		exit 0
	fi

	osascript get_note_by_index.scpt $2 >  "/tmp/note_$TITLE.txt"
else
	TITLE=$1
	osascript get_note.scpt "$TITLE" > "/tmp/note_$TITLE.txt"
fi

vim "/tmp/note_$TITLE.txt"

NOTE_BODY=$(cat "/tmp/note_$TITLE.txt")

rm "/tmp/note_$TITLE.txt"


FINAL_TEXT=""

IFS=$'\n'
for j in $NOTE_BODY 
do
	FINAL_TEXT="$FINAL_TEXT<div>$j</div>"
done

osascript set_note.scpt "$TITLE" "$FINAL_TEXT"

osascript -e 'quit app "Notes"'


