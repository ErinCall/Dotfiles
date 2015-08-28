
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
