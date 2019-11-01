i=1
for avi in input/*.mp4; do
    name=`echo $avi | cut -f1 -d'.'`
    jpg_ext='.jpg'
    echo "$i": extracting the first frame of the video "$avi" into "$name$jpg_ext"
    ffmpeg -loglevel panic -i $avi -vframes 1 -f image2 "$name$jpg_ext"
    i=$((i+1))
 done

ffmpeg -i input/typhoon_%d.jpg output/output.mp4