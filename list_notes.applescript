tell application "Notes"
	tell account "iCloud"
		tell folder "Notes"
			set notes_list to get name of every note
			set notes_str to ""
			set idx to 1
			repeat with current_note in notes_list
				set notes_str to notes_str & idx & " : " & current_note & linefeed
				set idx to idx + 1
			end repeat
			
			set notes_str to (characters 1 through ((length of notes_str) - 1) of notes_str) as string
			
			return notes_str
			
		end tell
	end tell
end tell