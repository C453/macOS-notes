on run {ACCOUNT_NAME}
	tell application "Notes"
		if not (exists account ACCOUNT_NAME) then
			return
		end if
		tell account ACCOUNT_NAME
			get name of every folder
		end tell
	end tell
end run