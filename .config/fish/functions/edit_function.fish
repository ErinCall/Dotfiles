function edit_function
  eval $EDITOR (printf "~/.config/fish/functions/%s.fish" $argv)
end
