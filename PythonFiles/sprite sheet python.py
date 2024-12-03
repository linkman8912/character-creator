from PIL import Image
import os

# 500 800
# using path.expanduser() getting username

user_path = os.path.expanduser("~")

def create_sprite_sheet(image_paths, cols, rows, output_path):
    """Creates a sprite sheet from a list of image paths."""

    images = [Image.open(path) for path in image_paths]
    width, height = images[0].size

    sprite_sheet = Image.new('RGBA', (width * cols, height * rows))

    for i, image in enumerate(images):
        x = (i % cols) * width
        y = (i // cols) * height
        sprite_sheet.paste(image, (x, y))

    sprite_sheet.save(output_path)

def get_image_walk(x,y):
    return user_path + "/AppData/Roaming/custom_characters/" + y +  "/sprite data/" + str(x) + "ss.png"

def get_image_idle(x,y):
     return user_path + "/AppData/Roaming/custom_characters/" + y + "/idle data/" + str(x) + "ss.png"


if __name__ == '__main__':
    #for m in range(8):
        image_paths_body = []
        image_paths_head = []
        for i in range(45):
            image_paths_body.append(get_image_walk(i+1,"body_sprites"))
            #image_paths_head.append(get_image_walk(i+1,"head_sprites"))
            
            #print(why)
        print("walk sheet done")
        #print(image_paths)
        create_sprite_sheet(image_paths_body, 5, 9, user_path + "/Documents/Custom Character Maker/sprite sheets/body_walk_sprite_sheet.png")
        #create_sprite_sheet(image_paths_head, 5, 9, "C:/Users/PROJECT SKULLY/Documents/Custom Character Maker/sprite sheets/head_walk_sprite_sheet.png")

        image_paths_body = []
        image_paths_head = []
        for i in range(5):
            image_paths_body.append(get_image_idle(i+1,"body_sprites"))
            #image_paths_head.append(get_image_idle(i+1,"head_sprites"))
            
            #print(why)
        print("idle sheet done")
        #print(image_paths)
        create_sprite_sheet(image_paths_body, 1, 5, user_path + "/Documents/Custom Character Maker/sprite sheets/body_idle_sprite_sheet.png")
        #create_sprite_sheet(image_paths_head, 1, 5, "C:/Users/PROJECT SKULLY/Documents/Custom Character Maker/sprite sheets/head_idle_sprite_sheet.png")

# C:\Users\PROJECT SKULLY\AppData\Roaming\custom_characters\sprite data
