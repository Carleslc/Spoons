import argparse
from PIL import Image

def set_args():
    global args
    parser = argparse.ArgumentParser()
    parser.add_argument("image", help="Image to read")
    parser.add_argument("x", help="Pixel x", type=int)
    parser.add_argument("y", help="Pixel y", type=int)
    args = parser.parse_args()

if __name__ == "__main__":
    set_args()

    image = Image.open(args.image)
    image.putalpha(255)
    [r, g, b, a] = image.load()[args.x, args.y]
    print(str(r) + ',' + str(g) + ',' + str(b))