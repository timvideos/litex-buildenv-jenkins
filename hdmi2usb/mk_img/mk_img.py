
"""
Make test images
"""

from PIL import Image, ImageDraw

def diag():
    im = Image.new(mode="1", size=(1280,720), color=1)

    draw = ImageDraw.Draw(im)
    for i in range(1, 1280+720, 3):
        draw.line((0, i, i, 0), width=1)

    im.save(open('diagonal.png','wb'), "PNG")

    return

def ellipse():
    im = Image.new(mode="RGB", size=(1280,720), color=1)

    draw = ImageDraw.Draw(im)

    # red in white to deal with odd edge things
    draw.ellipse((0,0,1280,720), outline="white")
    draw.ellipse((1,1,1280-1,720-1), outline="white")

    im.save(open('ellipse.png','wb'), "PNG")

    return



def main():
    diag()
    ellipse()

if __name__ == '__main__':
    main()
