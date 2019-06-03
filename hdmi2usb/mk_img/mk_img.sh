
gst-launch-1.0 videotestsrc pattern=smpte75 num-buffers=1 ! \
    video/x-raw,width=1280,height=720 ! \
    videoconvert ! pngenc ! filesink location=smpte75.png

gst-launch-1.0 videotestsrc pattern=smpte100 num-buffers=1 ! \
    video/x-raw,width=1280,height=720 ! \
    videoconvert ! pngenc ! filesink location=smpte100.png

python3 mk_img.py

scp \
    diagonal.png ellipse.png smpte75.png smpte100.png \
    pi@oppi:temp
