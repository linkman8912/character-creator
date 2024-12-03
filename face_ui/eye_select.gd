extends Node2D
var  slider_node = "sliders"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(7):
		get_node(str(i+1)).text = "eye" + str(i+1)


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
	_get_sliders()

var l_r = "left"
var id = 1
func _get_lr():
	
	return l_r
func _get_id():
	return id

func _get_sliders():
	var x = get_node(slider_node+"/x").value/1000
	var y = get_node(slider_node+"/y").value/1000
	var r = get_node(slider_node+"/rotate").value
	var slider_values = [x,y,r]
	print(slider_node,"slide")
	
	return slider_values
func a_on__pressed():
	
	id = 1
#-233
#300
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
	
func b_on__pressed():
	id = 2
	pass # Replace with function body.

func c_on__pressed():
	id = 3
	pass # Replace with function body.


func d_on__pressed():
	id = 4
	pass # Replace with function body.


func e_on__pressed():
	id = 5
	pass # Replace with function body.


func f_on__pressed():
	id = 6
	pass # Replace with function body.


func g_on__pressed():
	id = 7
	pass # Replace with function body.

func _on_r_pressed():
	slider("r")
	l_r = "right"
	pass # Replace with function body.


func _on_l_pressed():
	slider("l")
	l_r = "left"
