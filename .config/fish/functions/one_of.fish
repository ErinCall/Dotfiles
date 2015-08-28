function one_of
    set idx (math (random) '%' (count $argv) + 1)
    echo $argv[$idx]
end

