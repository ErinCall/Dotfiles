function patchlog
    git log --color --patch --stat --no-prefix $argv | less --pattern '^commit|^diff'
end
