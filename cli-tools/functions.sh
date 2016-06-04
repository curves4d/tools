# This function sets a global variable to the last branch in git
function set_branch {
    last_branch=$(git branch | grep '*' | sed 's/* //g')
}


# This function moves to the branch specified
function gmt {
    this_branch=$(git branch | grep '*' | sed 's/* //g')
    git checkout $1
    if [[ $? -eq 0 ]]; then
        echo "Last branch being modified"
        last_branch=$this_branch
    fi
}

# Create new branch and move to it and save last branch
function gmn {
    this_branch=$(git branch | grep '*' | sed 's/* //g')
    git checkout -b $1
    if [[ $? -eq 0 ]]; then
        echo "Last branch being modified"
        last_branch=$this_branch
    fi
}

# Move to the last git branch
function gmb {
    if [[ -n "$last_branch" ]]; then
        gmt $last_branch
    else
        echo "No last branch"
    fi
}


# Helper function which always saves the folder cd is moving to
function cdh {
    \cd $1
    last_code=$?
    echo "Last code: " $last_code
    if [[ $last_code -eq 0 ]]; then
        echo $(pwd) > ~/.cd
    fi
}


# Move to the last folder that was cd'ed
function cdb {
    cdh $(cat ~/.cd)
}


# Copy the dot files from $HOME to $cli_tools_dir
function cpt {
    cp $HOME/.zshrc $cli_tools_dir/.zshrc
    cp $HOME/.vimrc $cli_tools_dir/.vimrc
}


function cli-tools-workflow {
    cd $cli_tools_dir
    cpt
    gc
    m
    gp
    gmt local
    gc
    grim
    merge_exit_code=$?
    if [ $merge_exit_code -ne 0 ]; then
        echo "Exit code from merge:" $merge_exit_code
        echo "Resolve now?(y/n)"
        read ans
        if [ $ans == "n" ]; then
            # just go back and deal with it later
            cd -
        else
            # TODO: start vim and edit the conflicted file
            # pass for now
        fi
    else
        m
        gr local
        gpom
        cd -
    fi
}
