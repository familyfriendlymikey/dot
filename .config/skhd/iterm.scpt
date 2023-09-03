tell application "System Events"
	set activeApp to name of first application process whose frontmost is true
end tell

if activeApp is "Finder" then
	tell application "Finder"
		set currentPath to (target of front window as alias)
	end tell

	tell application "iTerm"
		tell application "iTerm"
			set newWindow to (create window with default profile)
			tell current session of newWindow
				write text "cd " & quoted form of POSIX path of currentPath & " && clear"
			end tell
		end tell
		activate
	end tell

else
	tell application "iTerm"
		create window with default profile
		activate
	end tell
end if
