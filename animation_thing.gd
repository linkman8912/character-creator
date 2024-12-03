extends Node2D


# Called when the node enters the scene tree for the first time.
@onready var walk_sprite = $walk_sprite_sheet
@onready var idle_sprite = $idle_sprite_sheet

func _set_sprite_sheet(walk,idle):
	var image_wb = Image.load_from_file(walk)
	walk_sprite.texture = ImageTexture.create_from_image(image_wb)
	var image_ib = Image.load_from_file(idle)
	idle_sprite.texture = ImageTexture.create_from_image(image_ib)
