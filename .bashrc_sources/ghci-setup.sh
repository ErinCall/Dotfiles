function local_ghci() {
    if [ -d .cabal-sandbox ]; then
        packages_conf=$(ls .cabal-sandbox | grep packages.conf.d | head -n1)
        ghci -no-user-package-db -package-db ".cabal-sandbox/$packages_conf" $@
    else
        echo "You don't have a sandbox so I don't know what to do"
        return 1
    fi
}
