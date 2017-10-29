function zipfolder() {
  for dir in $(ls $1) 
  do
    dir_child=$1"/"$dir
    for category in $(ls $dir_child)
    do
      preview=$dir_child"/"$category"/preview" 
      source_folder=$dir_child"/"$category"/source"
      [ ! -d source ] && mkdir $source_folder 
      for target in $(ls $preview)
      do
        if [ -d $preview"/"$target ]
        then
          cd $preview"/"$target
          zip -r $source_folder"/"$target".zip" ./* 
        fi
      done
    done
  done
}

root_dir="/home/zn/work/steel/public/cssthemes"

test_dir="/home/zn/work/steel/public/assets/cssthemes/test"

zipfolder $root_dir
