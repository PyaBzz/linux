dirMissing() {
    # synopsis: dirMissing <PathToDir>
    # No quotes around the path!
    if [ ! -d $1 ]; then true; else false; fi
}
