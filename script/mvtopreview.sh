function mvtopreview() {
  for dir in $(ls $1)
  do
    dir_child=$1"/"$dir
    if test -d $dir_child
    then
      for element in $(ls $dir_child)
      do
        if test -d $dir_child"/"$element
        then
          [ ! -d preview ] && mkdir $dir_child"/"$element"/preview"
          mv $dir_child"/"$element"/"* $dir_child"/"$element"/preview"
        fi
      done
    fi
  done
}

root_dir="/home/zn/work/steel/public/cssthemes"

test_dir="/home/zn/work/project/steel/public/SourceFiles/testpre"

mvtopreview $root_dir
