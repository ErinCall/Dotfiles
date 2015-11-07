function edit_function
  exec $EDITOR (printf "~/.config/fish/functions/%s" $argv)
end
