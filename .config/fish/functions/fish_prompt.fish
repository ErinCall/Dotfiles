
function fish_prompt --description "Erin's cool prompt"
	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	set_color -o yellow # should this be a $fish_color_jobs?
	jobs | wc -l | sed 's/ //g' | tr -d '\n'

	if test $last_status -eq 0
		echo -n (one_of $success_icons) " "
	else
		echo -n (one_of $failure_icons) " "
	end

	# report the duration of the last command, if it was >= 10 seconds.
	# This code isn't resistant to DST changes, leap seconds, etc. WHATEVER.
	# command_duration is set by potentially_notify in config.fish
	if begin
		test -n "$command_duration"
		and math "$command_duration" ">" 9 >/dev/null
	end #end begin
		set -l minutes (math "$command_duration" '/' '60')
		set -l seconds (math "$command_duration" '%' '60')
		set    seconds (printf '%02d' $seconds )
		echo -n "[$minutes:$seconds] "
	end

	set_color $fish_color_cwd
	echo (prompt_pwd) | tr -d '\n'
	set_color normal

	printf ' %s' (git_prompt)

	if set -q VIRTUAL_ENV
	    echo -n -s " [" (basename "$VIRTUAL_ENV") "]"
	end

	echo
	echo -n '§ '

end
