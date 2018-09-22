on run {TITLE}
	tell application "Notes"
		tell account "iCloud"
			tell folder "Notes"
				if exists note TITLE then
					return body of note TITLE
				else
					return
				end if
			end tell
		end tell
	end tell
end run