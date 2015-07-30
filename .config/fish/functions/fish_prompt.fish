
function fish_prompt --description "Erin's cool prompt"
	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	set_color -o yellow # should this be a $fish_color_jobs?
	jobs | wc -l | sed 's/ //g' | tr -d '\n'

	set_color -o red
	echo -n "§"

	set_color $fish_color_cwd
	echo (prompt_pwd) | tr -d '\n'
	set_color normal

	printf ' %s ' (git_prompt)

	if not test $last_status -eq 0
		set_color $fish_color_error
	end

	echo
	echo -n '§ '

end
