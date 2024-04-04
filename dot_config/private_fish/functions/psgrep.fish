function psgrep --argument process
        echo "Grepping for processes matching $process..."
        ps aux | rg $process | rg -v rg
end
