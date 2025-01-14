gc() {
    local BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
    local TASK_NUMBER=$(echo "$BRANCH_NAME" | grep -oE '[A-Z]+-[0-9]+')

    # Check if "-m" flag is present
    local MESSAGE_FLAG=false
    for arg in "$@"; do
        if [ "$arg" = "-m" ]; then
            MESSAGE_FLAG=true
            break
        fi
    done

    if [ "$MESSAGE_FLAG" = true ]; then
        # Separate files and the commit message
        local FILES=()
        local COMMIT_MESSAGE=""
        local ADD_TO_MESSAGE=false

        for arg in "$@"; do
            if [ "$arg" = "-m" ]; then
                ADD_TO_MESSAGE=true
            elif [ "$ADD_TO_MESSAGE" = true ]; then
                COMMIT_MESSAGE="$COMMIT_MESSAGE $arg"
            else
                FILES+=("$arg")
            fi
        done

        # Trim leading/trailing whitespace from the commit message
        COMMIT_MESSAGE=$(echo "$COMMIT_MESSAGE" | sed 's/^ *//;s/ *$//')

        # Add task number if available
        if [ -n "$TASK_NUMBER" ]; then
            COMMIT_MESSAGE="$TASK_NUMBER $COMMIT_MESSAGE"
        fi

        # Commit the files with the message
        git commit "${FILES[@]}" -m "$COMMIT_MESSAGE"
    else
        echo "Error: Missing commit message. Usage: gc <file1> <file2> ... -m <message>"
    fi
}