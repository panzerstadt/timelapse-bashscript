cd input

i=1
for avi in *.mp4; do
    name=`echo $avi | cut -f1 -d'.'`
    jpg_ext='.jpg'
    echo "$i": extracting the first frame of the video "$avi" into "$i$jpg_ext"
    ffmpeg -loglevel panic -i $avi -vframes 1 -f image2 "$i$jpg_ext"
    i=$((i+1))
done

cd ..

ffmpeg -i input/%d.jpg output.mp4