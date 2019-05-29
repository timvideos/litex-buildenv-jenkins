import serial

from ck_tty import ck_tty
from ck_ab_gst import ck_ab_gst

class ck_video(ck_ab_gst, ck_tty):


    def set_pattern(self):

        with serial.Serial(self.args.tty, 115200, timeout=1) as self.ser:

            # send command
            self.tx('\n\nvideo_matrix connect pattern encoder\r\n')
            lines = self.rx()
            assert 'Connecting pattern to encoder' in lines

    def test(self):

        self.set_pattern()

        tempdir="/tmp"
        pipeline = 'v4l2src device={dev} num-buffers=3 ! jpegdec !  queue ! videoconvert ! pngenc ! multifilesink location="{tempdir}/frame-%d.png"'.format(
                dev=self.args.video,
                tempdir=tempdir,
                )

        self.run_pipeline(pipeline)

if __name__=='__main__':
    t = ck_video()
    t.main()


