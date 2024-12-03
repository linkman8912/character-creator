extends Camera3D
@onready var anim = get_parent().get_parent().get_node("model/walking/AnimationPlayer")
var walk = 1
var idle = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	print("f")
	var dir = DirAccess.open("user://")
	#dir.make_dir("sprite data")
	#dir.make_dir("idle data")
	
	dir = DirAccess.open("user://head_sprites/sprite data")
	for i in dir.get_files():
		walk += 1
	#if walk > 45:
	walk = 1
	dir = DirAccess.open("user://head_sprites/idle data")
	for i in dir.get_files():
		idle += 1
	#if idle > 5:
	idle = 1


var anim_count = 1

func screenshots(folder):
	#print("screenswait:")
	await RenderingServer.frame_post_draw
	#sprite data
	#print("screens")
	var viewport = get_viewport()
	var img = viewport.get_texture().get_image()
	match folder:
		"sprite data":
			img.save_png("user://head_sprites/" + folder + "/" +str(walk)+ "ss.png")
			walk +=1 
		"idle data":
			img.save_png("user://head_sprites/" + folder + "/" +str(idle)+ "ss.png")
			idle +=1

func get_walk_count():
	return walk
