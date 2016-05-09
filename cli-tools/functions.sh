#!/usr/bin/env bash


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
    cd $1
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


# Copy dist over to the named location on s3
function ds3 {
    echo "Copying /Users/udbhav.singh/br/work/src/backend/dist to s3://br-user/data_pipeline_release/$1/"
    s3cmd sync /Users/udbhav.singh/br/work/src/backend/dist s3://br-user/data_pipeline_release/$1/
}


# Show page from ontology
function ont {
    curl "https://ontology.corp.bloomreach.com/kitt/owf2?url=${1}&merchant=${2}&query=${3}" | less
}
