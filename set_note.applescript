on run {TITLE, BODY_TEXT}
	tell application "Notes"
		tell account "iCloud"
			tell folder "Notes"
				if not (exists note TITLE) then
					make new note with properties {name:TITLE}
				end if
				set body of note TITLE to BODY_TEXT
			end tell
		end tell
	end tell
end run