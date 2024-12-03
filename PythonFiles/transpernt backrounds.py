import sys
import time
from PIL import Image
from subprocess import call
import os

# 500 800
# using path.expanduser() getting username
user_path = os.path.expanduser("~")
def crop_ss():
     call(["python", "PythonFiles/image cropper.py"])

def create_ss():
     call(["python", "PythonFiles/sprite sheet python.py"])

start_time = time.time()

def convertImage(sheet):
        
        #img = Image.open("C:/Users/PROJECT SKULLY/AppData/Roaming/custom_characters/sprite data/2ss.png")
        img = Image.open(user_path + "/Documents/Custom Character Maker/sprite sheets/" + sheet +".png")
        img = img.convert("RGBA")

        datas = img.getdata()
        target_color = (33, 199, 80)  # This is the green color you're targeting (RGB)
        newData = []
        tolerance = 40  # Set your tolerance level for near-green colors

        for item in datas:
            # Check if the color is within the tolerance range of green
            if all(target_color[i] - tolerance <= item[i] <= target_color[i] + tolerance for i in range(3)):
                newData.append((255, 255, 255, 0))  # Make it transparent
            else:
                newData.append(item)

        img.putdata(newData)
        #img.save("C:/Users/PROJECT SKULLY/AppData/Roaming/custom_characters/sprite data/1ss.png", "PNG")
        
        img.save(user_path + "/Documents/Custom Character Maker/sprite sheets/" + sheet +".png", "PNG")
        print("Successful")

#crop_ss()
create_ss()

#convertImage("body_walk_sprite_sheet")
#convertImage("body_idle_sprite_sheet")
#convertImage("head_idle_sprite_sheet")
#convertImage("head_walk_sprite_sheet")

end_time = time.time()

elapsed_time = end_time - start_time

print("Elapsed time:", elapsed_time) 
