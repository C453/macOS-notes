on run {IDX}
	tell application "Notes"
		tell account "iCloud"
			tell folder "Notes"
				set notes_list to get name of every note
				set len to length of notes_list
				
				set IDX to (IDX as number)
				
				if IDX is less than len and IDX is greater than 0 then
					set selected_note to item IDX of notes_list
					return body of note selected_note
				end if
				
				return
			end tell
		end tell
	end tell
end run