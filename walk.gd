extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var image = Image.load_from_file("res://sprite sheets/body_walk_sprite_sheet.png")
	texture = ImageTexture.create_from_image(image)
