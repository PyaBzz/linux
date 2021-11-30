addFileInFileAfterMarker() {
    # synopsis: addFileInFileAfterMarker <sourceFile> <targetFile> <markerText>
    local sourceFile=$1
    local targetFile=$2
    local marker=$3
    sed -i "/$marker/r $sourceFile" $targetFile
}
