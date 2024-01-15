function psgrep --argument process
        echo "Grepping for processes matching $process..."
        ps aux | grep $process | grep -v grep
end