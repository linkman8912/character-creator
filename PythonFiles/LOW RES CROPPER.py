
# Importing Image class from PIL module
from PIL import Image

def get_image_walk(x,y):
    return "C:/Users/PROJECT SKULLY/AppData/Roaming/custom_characters/" + y +  "/sprite data/" + str(x) + "ss.png"


def get_image_idle(x,y):
     return "C:/Users/PROJECT SKULLY/AppData/Roaming/custom_characters/" + y + "/idle data/" + str(x) + "ss.png"


for f in range(2):
    match f:
        case 0: folder = "body_sprites"
        case 1: folder = "head_sprites"

    for i in range(45):
        # Opens a image in RGB mode
        im = Image.open(get_image_walk(1+i,folder))
        # Size of the image in pixels (size of original image)
        # (This is not mandatory)
        width, height = im.size

        # Setting the points for cropped image
        if f == 0:
            left = 450   # Starting from the left
            top = 50    # Starting from the top
            right = 700  # Width of the cropped area
            bottom = 500 # Height of the cropped area
        if f == 1:
            left = 500   # Starting from the left
            top = 50    # Starting from the top
            right = 650  # Width of the cropped area
            bottom = 300 # Height of the cropped area  

        # Cropped image of above dimension
        # (It will not change original image)
        im1 = im.crop((left, top, right, bottom))

        # Shows the image in image viewer
        #im1.show()
        im1.save(get_image_walk(1+i,folder))
        print("walk pngs cropped")

    for i in range(5):
        # Opens a image in RGB mode
        im = Image.open(get_image_idle(1+i,folder))
        # Size of the image in pixels (size of original image)
        # (This is not mandatory)
        width, height = im.size

        # Setting the points for cropped image
        left = 450   # Starting from the left
        top = 50    # Starting from the top
        right = 700  # Width of the cropped area
        bottom = 500 # Height of the cropped area

        # Cropped image of above dimension
        # (It will not change original image)
        im1 = im.crop((left, top, right, bottom))

        # Shows the image in image viewer
        #im1.show()
        im1.save(get_image_idle(1+i,folder))
        print("idle pngs cropped")

