extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var r_go = true
func rotat(x):
	if r_go:
		r_go = false
		rotate_y(deg_to_rad(x))
		await get_tree().create_timer(0.1).timeout
		r_go = true
func _process(delta):
	rotat(1)
