tar -xzf $1 -C $2
NewDirectory=$( $1 : ${#$1}-4 )
echo $NewDirectory
cd $2/big_dir
grep -l 'DELETE ME!' * > FilesToDelete
FileToBeRemoved=$(head -n 1 FilesToDelete)
while [ "$FileToBeRemoved" != '' ]
do
	rm -rf $FileToBeRemoved
	tail -n +2 'FilesToDelete' > 'FilesToDelete.tmp' && mv 'FilesToDelete.tmp' 'FilesToDelete'
	FileToBeRemoved=$(head -n 1 FilesToDelete)
done
