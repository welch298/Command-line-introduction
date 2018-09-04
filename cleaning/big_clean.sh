tar -xzf $1 -C $2
NewDirectory=$(basename $1 ".tgz")
StartingDirectory=$(pwd)
cd $2/$NewDirectory
grep -l 'DELETE ME!' * > FilesToDelete
FileToBeRemoved=$(head -n 1 FilesToDelete)
while [ "$FileToBeRemoved" != '' ]
do
	rm -rf $FileToBeRemoved
	tail -n +2 'FilesToDelete' > 'FilesToDelete.tmp' && mv 'FilesToDelete.tmp' 'FilesToDelete'
	FileToBeRemoved=$(head -n 1 FilesToDelete)
done
rm -rf FilesToDelete
cd ../
tar -czvf cleaned_$NewDirectory.tgz $NewDirectory
mv cleaned_$NewDirectory.tgz $StartingDirectory
cd $StartingDirectory
