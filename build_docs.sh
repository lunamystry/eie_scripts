#! /bin/sh
# A little script to watch for changes in the document folder
# and recompile the documentation if there is a change.

SOURCE_DIR=$HOME/Documents/sphinx_docs/source
MAKE_DIR=$HOME/Documents/sphinx_docs/

compile_docs ()
{
    cur_dir=$(pwd)
    cd $MAKE_DIR
    make html
    cd $cur_dir
    xdotool search --name ".*irefox.*" key F5
}

while true; do
    inotifywait --recursive --quiet -q --event modify $SOURCE_DIR &&\
    compile_docs
done

