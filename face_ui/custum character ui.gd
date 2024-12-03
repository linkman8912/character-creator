extends Node2D

@onready var node = get_node("head"+"_ui")
var id  = 1
var l_r = "left"
var id_past = 1
var ui_output = null
var slider = 1
var slider_past = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	show_ui("fetured",true)
var done = false
func show_ui(feture,nill):
	if not nill:
		$mouth_ui.visible = false
		$eye_ui.visible = false
		$nose_ui.visible = false
		$head_ui.visible = false
		$eyebrow_ui.visible = false
		$skincolor_ui.visible = false
		get_node(feture+"_ui").visible = true
		node = get_node(feture+"_ui")
	if done:
		return node
	else:
		id_past = id
		slider_past = slider
		slider = node._get_sliders()
		id = node._get_id()
		if not id == id_past or not slider_past == slider:
			l_r = node._get_lr()
		ui_output = [str(node).split("_")[0],id,l_r,node._get_sliders()]
		print(node._get_sliders(),"nod_slid")
		
		get_parent().get_parent().get_parent().get_ui(ui_output)

func get_ui():
	return ui_output
func _on_mouth_pressed():
	show_ui("mouth",false)


func _on_eyes_pressed():
	show_ui("eye",false)

func _on_nose_pressed():
	show_ui("nose",false)


func _on_head_pressed():
	show_ui("head",false)


func _on_eyebrow_pressed():
	show_ui("eyebrow",false)


func _on_skincolor_pressed():
	show_ui("skincolor",false)


func _on_button_pressed():
	ui_output = ["mouth",null,null,null]
	get_parent().get_parent().get_parent().get_ui(ui_output)
	ui_output = ["eye",null,"left",null]
	get_parent().get_parent().get_parent().get_ui(ui_output)
	ui_output = ["eye",null,"right",null]
	get_parent().get_parent().get_parent().get_ui(ui_output)
	ui_output = ["eyebrow",null,"left",null]
	get_parent().get_parent().get_parent().get_ui(ui_output)
	ui_output = ["eyebrow",null,"right",null]
	get_parent().get_parent().get_parent().get_ui(ui_output)
	ui_output = ["nose",null,null,null]
	get_parent().get_parent().get_parent().get_ui(ui_output)
	ui_output = ["skincolor",null,null,null]
	get_parent().get_parent().get_parent().get_ui(ui_output)
	ui_output = ["head",null,null,null]
	get_parent().get_parent().get_parent().get_ui(ui_output)
	get_parent().get_parent().get_parent()._next()
