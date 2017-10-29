function goinit --description "Symlink the folder Go wants to the folder I want"
    ln -hfs (pwd) ~/.go/src/
end
