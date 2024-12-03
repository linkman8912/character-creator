extends Node2D


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.



var l_r = "left"
var id = 1
func _get_id():
	return id
func _get_lr():
	return l_r
func _get_sliders():
	var x = $sliders/x.value/1000
	var y = $sliders/y.value/1000
	var r = $sliders/rotate.value
	var slider_values = [x,y,r]
	return slider_values
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


func e_on__pressed():
	id = 5
	pass # Replace with function body.


func f_on__pressed():
	id = 6
	pass # Replace with function body.
