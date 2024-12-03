# Importing Image class from PIL module
from PIL import Image
import os
#500 800
# using path.expanduser() getting username

user_path = os.path.expanduser("~")

#put y back in for head function
def get_image_walk(x,y):
    return user_path +"/AppData/Roaming/custom_characters/" +  "body_sprites"+ "/sprite data/" + str(x) + "ss.png"

def get_image_idle(x,y):
     return user_path +"/AppData/Roaming/custom_characters/" + "body_sprites" + "/idle data/" + str(x) + "ss.png"


for f in range(1):
    match f:
        case 0: folder = "body_sprites"
        case 1: folder = "head_sprites"

    for i in range(1):
        # Opens a image in RGB mode
        im = Image.open(get_image_walk(1+i,folder))
        # Size of the image in pixels (size of original image)
        # (This is not mandatory)
        width, height = im.size

        # Setting the points for cropped image
        if f == 0:
            left = 150   # Starting from the left
            top = 100    # Starting from the top
            right = 450  # Width of the cropped area
            bottom = 650 # Height of the cropped area
        if f == 1:
            left = 200   # Starting from the left
            top = 350    # Starting from the top
            right = 600  # Width of the cropped area
            bottom = 1000 # Height of the cropped area  


        # Cropped image of above dimension
        # (It will not change original image)
        im1 = im.crop((left, top, right, bottom))

        # Shows the image in image viewer
        im1.show()
        #im1.save(get_image_walk(1+i,folder))
        print("walk pngs cropped")

    for i in range(5):
        # Opens a image in RGB mode
        im = Image.open(get_image_idle(1+i,folder))
        # Size of the image in pixels (size of original image)
        # (This is not mandatory)
        width, height = im.size

        if f == 0:
            left = 150   # Starting from the left
            top = 100    # Starting from the top
            right = 450  # Width of the cropped area
            bottom = 650 # Height of the cropped area
        if f == 1:
            left = 200   # Starting from the left
            top = 350    # Starting from the top
            right = 600  # Width of the cropped area
            bottom = 1000 # Height of the cropped area  
        # Cropped image of above dimension
        # (It will not change original image)
        im1 = im.crop((left, top, right, bottom))

        # Shows the image in image viewer
        #im1.show()
        im1.save(get_image_idle(1+i,folder))
        print("idle pngs cropped")
