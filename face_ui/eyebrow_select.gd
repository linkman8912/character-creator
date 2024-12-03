extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(4):
		get_node(str(i+1)).text = "eyebrow" + str(i+1)

var  slider_node = "sliders"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_get_sliders()
	
	#print(id,l_r)
var slider_values = 0
func _get_sliders():
	var x = get_node(slider_node+"/x").value/1000
	var y = get_node(slider_node+"/y").value/1000
	var r = get_node(slider_node+"/rotate").value
	var slider_values = [x,y,r]
	print(slider_values)
	print(slider_node,"slide")
	return slider_values
var l_r = "left"
var id = 1
func _get_id():
	return id
func _get_lr():
	return l_r
func a_on__pressed():
	
	id = 1


func b_on__pressed():
	id = 2
	pass # Replace with function body.

func c_on__pressed():
	id = 3
	pass # Replace with function body.


func d_on__pressed():
	id = 4
	pass # Replace with function body.

func slider(lr):
	$sliders.visible  = false
	$sliders2.visible = false
	match lr:
		"l": 
			$sliders.visible  = true
			slider_node = "sliders"
		"r": 
			$sliders2.visible = true
			slider_node ="sliders2"



func _on_r_pressed():
	print(l_r)
	slider("r")
	l_r = "right"
	pass # Replace with function body.


func _on_l_pressed():
	slider("l")
	l_r = "left"
