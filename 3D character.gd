extends Node3D
var skin_color_id = 0
var skin_colors = [
[Color8(71, 28, 28),Color8(49, 11, 11)],
[Color8(95, 58, 22),Color8(110, 67, 25)], #dark brown
[Color8(149, 92, 35),Color8(181, 111, 41)], #medium brown,
[Color8(246, 198, 175),Color8(237, 186, 157)],
[Color8(255, 230, 227),Color8(247, 207, 195)]# true cracker tone
]
var facial_folder = "res://3d character textures/facial fetures"
var eyebrow_folder = facial_folder + "/eyebrows/eyebrow_"
var eye_folder = facial_folder + "/eyes/eye_"
var mouth_folder = facial_folder + "/mouths/mouth_"
var faces = []

@onready var head = get_node("rig/Skeleton3D/0_head/0_head")
@onready var body = get_node("rig/Skeleton3D/0_body_001")
@onready var nose = get_node("rig/Skeleton3D/0_nose_2/0_nose_2")
@onready var left_eye = get_node("rig/Skeleton3D/prophead/left_eye")
@onready var right_eye = get_node("rig/Skeleton3D/prophead/right_eye")
@onready var right_eyebrow = get_node("rig/Skeleton3D/prophead/right_eyebrow")
@onready var left_eyebrow = get_node("rig/Skeleton3D/prophead/left_eyebrow")
@onready var mouth = get_node("rig/Skeleton3D/prophead/mouth/mouth")
@onready var eye_y_slid = $CanvasLayer/HBoxContainer/Node2D/eye_ui/sliders/y
@onready var eye_x_slid = $CanvasLayer/HBoxContainer/Node2D/eye_ui/sliders/x
@onready var eye_r_slid = $CanvasLayer/HBoxContainer/Node2D/eye_ui/sliders/rotate
@onready var eye_y_slidr = $CanvasLayer/HBoxContainer/Node2D/eye_ui/sliders2/y
@onready var eye_x_slidr = $CanvasLayer/HBoxContainer/Node2D/eye_ui/sliders2/x
@onready var eye_r_slidr = $CanvasLayer/HBoxContainer/Node2D/eye_ui/sliders2/rotate

@onready var eyelid_y_slid_l = $CanvasLayer/HBoxContainer/Node2D/eyebrow_ui/sliders/y
@onready var eyelid_x_slid_l = $CanvasLayer/HBoxContainer/Node2D/eyebrow_ui/sliders/x
@onready var eyelid_r_slid_l = $CanvasLayer/HBoxContainer/Node2D/eyebrow_ui/sliders/rotate

@onready var eyelid_y_slid_r = $CanvasLayer/HBoxContainer/Node2D/eyebrow_ui/sliders2/y
@onready var eyelid_x_slid_r = $CanvasLayer/HBoxContainer/Node2D/eyebrow_ui/sliders2/x
@onready var eyelid_r_slid_r = $CanvasLayer/HBoxContainer/Node2D/eyebrow_ui/sliders2/rotate


@onready var mouth_y_slid = $CanvasLayer/HBoxContainer/Node2D/mouth_ui/sliders/y
@onready var mouth_x_slid = $CanvasLayer/HBoxContainer/Node2D/mouth_ui/sliders/x

var texture = load("res://3d character textures/skin_colors/0_brown_body.png")
# Called when the node enters the scene tree for the first time.
func set_facial_feture(feture,id,l_r):
	var texture = null
	var texture_path = null
	var node = null
	
	match feture:
		"eyebrow":
			texture = eyebrow_folder + str(id) + ".png"
			node = get_node("rig/Skeleton3D/prophead/"+ l_r +"_eyebrow")
		"eye":
			texture = eye_folder + str(id) + ".png"
			node = get_node("rig/Skeleton3D/prophead/" + l_r + "_eye")
			#rig/Skeleton3D/prophead/left_eye
		"mouth":
			texture = mouth_folder + str(id) + ".png"
			node = mouth
			#print("mith")
		"head":
			set_head(id)
		"nose":
			set_nose(id)
		"skin":
			_set_skin_color(id)
		_:
			print("invalid face var")
	if not( texture == null and node == null):
		texture_path = load(texture)
		node.set_texture(0,texture_path)
	
	return texture
func _set_skin_color(color):
	var nose_material =StandardMaterial3D.new()
	var body_material = StandardMaterial3D.new()
	var skin = color
	body_material.albedo_color = skin_colors[skin][0] 
	head.mesh.surface_set_material(0, body_material) 

	body.mesh.surface_set_material(0, body_material) 
	nose_material.albedo_color = skin_colors[skin][1]
	nose.mesh.surface_set_material(0, nose_material) 
func set_head(id):
	for i in range(5):
		get_node( "rig/Skeleton3D/"+str(i) + "_head").visible = false
	head = get_node( "rig/Skeleton3D/"+str(id) + "_head/" +str(id) + "_head")
	get_node( "rig/Skeleton3D/"+str(id) + "_head").visible = true
func set_nose(n_id):
	for m in range(4):
		get_node("rig/Skeleton3D/nose_" + str(m)).visible = false
	nose = get_node("rig/Skeleton3D/nose_" + str(n_id) + "/nose_" + str(n_id))
	get_node("rig/Skeleton3D/nose_" + str(n_id)).visible = true
var new = true
func _not_new():
	new = false
func _ready():
	var face_f = "eye"
	var face_f_id = 1 #eb 1-4 e1-7 m1-6
	var face_f_lr = "right"
	var head_id = 1 #0-4
	var nose_id = 0 #0-3
	set_facial_feture("eye",1,"right")
	set_facial_feture(null,null,null)
	set_facial_feture("eyebrow",1,"right")
	set_facial_feture("eye",1,"left")
	set_facial_feture("eyebrow",1,"left")
	set_facial_feture("mouth",1,null)
	set_nose(nose_id)
	set_head(head_id)
	_set_skin_color(0)
	append_ids()


#func _input(event):
var eye_l_in_p = true
var eye_r_in_p = true
var eyebrow_l_in_p = true
var eyebrow_r_in_p = true
var mouth_in_p = true
#0id,1 x,2 y,3 r ,l_r
var f_mouth_id = ["mouth"]
var f_eyes_id_r = ["eye"]
var f_eyes_id_l = ["eye"]

var f_eyelid_id = ["eyebrow"]
var f_head_id = ["head"]
var f_nose_id =["nose"]
var f_skin_id = ["skin"]
func append_ids():
	for i in range(5):
		f_mouth_id.append(null)
		f_eyes_id_l.append(null)
		
		f_eyes_id_r.append(null)

		f_eyelid_id.append(null)
		f_head_id.append(null)
		f_nose_id.append(null)
		f_skin_id.append(null)

var ent_e_l = true
var ent_e_r = true

func get_ui(ui):
	print(ui,"ui")
	#print(ui)
	var face_f = "mouth"
	var face_f_id = 1 #eb 1-4 e1-7 m1-6
	var face_f_lr = "right"
	var head_id = 2 #0-4
	var nose_id = 1 #0-3
	var trans = ui[3]
	
	if eye_l_in_p and ui[2] == "left":
		eye_y_slid.value =-11 
		eye_x_slid.value = 131
	if eye_r_in_p and ui[2] == "right":
		eye_y_slidr.value = -11
		eye_x_slidr.value = -193
	if eyebrow_l_in_p and ui[2] == "left":
		eyelid_y_slid_l.value =-138 
		eyelid_x_slid_l.value = 102
	#if eyebrow_r_in_p and ui[2] == "right":
		#eyelid_y_slid_r.value = -138
		#eyelid_x_slid_r.value = -193
	if mouth_in_p:
		mouth_x_slid.value = 0
		mouth_y_slid.value = 247
	#0id,1 x,2 y,3 r ,l_r
	if (ui[0] == "eye" or ui[0] == "eyebrow"  or ui[0] == "mouth") and not ui[1] == null:
		#print(type_string(typeof(ui.get_ui()[0])))
		
		face_f = ui[0]
		face_f_id = ui[1]
		face_f_lr = ui[2]
		set_facial_feture(face_f,face_f_id,face_f_lr)


	if ui[0] == "eye" and ui[2] == "left":
		ent_e_r = true
		eye_l_in_p = false
		left_eye.rotation_degrees.y = eye_r_slid.value
		left_eye.position.z = eye_y_slid.value/1000
		left_eye.position.x = eye_x_slid.value/1000
		f_eyes_id_l[1] = ui[1]
		f_eyes_id_l[2] = eye_r_slid.value
		f_eyes_id_l[3] = eye_x_slid.value/1000
		f_eyes_id_l[4] = eye_y_slid.value/1000
		f_eyes_id_l[5] = "left"
		print(eye_x_slid.value,f_eyes_id_r,"ideye")
		
	
	if ui[0] == "eye" and ui[2] == "right":
		eye_r_in_p = false
		right_eye.rotation_degrees.y = eye_r_slidr.value
		right_eye.position.z = eye_y_slidr.value/1000
		right_eye.position.x = eye_x_slidr.value/1000
		f_eyes_id_r[1] = ui[1]
		f_eyes_id_r[2] = eye_r_slidr.value
		f_eyes_id_r[3] = eye_x_slidr.value/1000
		f_eyes_id_r[4] = eye_y_slidr.value/1000
		f_eyes_id_r[5] = "right"

	if ui[0] == "eyebrow" and ui[2] == "left":
		eyebrow_l_in_p = false
		left_eyebrow.rotation_degrees.y =eyelid_r_slid_l.value
		left_eyebrow.position.z = eyelid_y_slid_l.value/1000
		left_eyebrow.position.x = eyelid_x_slid_l.value/1000
		f_eyelid_id[1] = ui[1]
		f_eyelid_id[2] = eyelid_r_slid_l.value
		f_eyelid_id[3] = eyelid_x_slid_l.value/1000
		f_eyelid_id[4] = eyelid_y_slid_l.value/1000
		f_eyelid_id[5] = "left"
		

	if ui[0] == "eyebrow" and ui[2] == "right":
		eyebrow_r_in_p = false
		right_eyebrow.rotation_degrees.y =eyelid_r_slid_r.value
		right_eyebrow.position.z = eyelid_y_slid_r.value/1000
		right_eyebrow.position.x = eyelid_x_slid_r.value/1000
		f_eyelid_id[1] = ui[1]
		f_eyelid_id[2] = eyelid_r_slid_r.value
		f_eyelid_id[3] = eyelid_x_slid_r.value/1000
		f_eyelid_id[4] = eyelid_y_slid_r.value/1000
		f_eyelid_id[5] = "right"

	if ui[0] == "mouth" :
		if  not ui[1] == null:
			mouth_in_p = false
			get_node("rig/Skeleton3D/prophead/mouth").rotation_degrees.y = trans[2]
			get_node("rig/Skeleton3D/prophead/mouth").position.z = trans[1]
			get_node("rig/Skeleton3D/prophead/mouth").position.x = trans[0]
		print(f_mouth_id)
		f_mouth_id[1] = ui[1]
		print(trans)
		f_mouth_id[2] = trans[0]
		f_mouth_id[3] = trans[1]
		f_mouth_id[4] = trans[2]
		f_mouth_id[5] = null

	#set_facial_feture(face_f, face_f_id, face_f_lr)
	
	if ui[0] == "nose":
		if  not ui[1] == null:
			set_nose(ui[1] - 1)
			_set_skin_color(skin_color_id)
			var transs = ui[3]
			nose.rotation_degrees.z = transs[2]
			nose.global_position.y = transs[1]
			nose.global_position.x = transs[0]
		f_nose_id[1] = ui[1]
		f_nose_id[2] = trans[0]
		f_nose_id[3] = trans[1]
		f_nose_id[4] = trans[2]
		f_nose_id[5] = null

	if ui[0] == "head":
		if  not ui[1] == null:
			set_head(ui[1] - 1)
			_set_skin_color(skin_color_id)
		f_head_id[1] = ui[1]
		f_head_id[2] = null
		f_head_id[3] = null
		f_head_id[4] = null
		f_head_id[5] = null

	if ui[0] == "skincolor":
		if  not ui[1] == null:
			skin_color_id = ui[1] - 1
			_set_skin_color(skin_color_id)
		f_skin_id[1] = ui[1]
		f_skin_id[2] = null
		f_skin_id[3] = null
		f_skin_id[4] = null
		f_skin_id[5] = null

#0id,1 x,2 y,3 r ,l_r
func _exacute_all_info(inf):
	var feture_types = 5
	for i in range(feture_types):
		var feture_data = inf[i]
		print(inf)
		set_facial_feture(feture_data[0],feture_data[1],feture_data[5])
		var x_value = feture_data[2]
		var y_value = feture_data[3]
		print(feture_data)
		eye_y_slid.value = y_value
		eye_x_slid.value = x_value
		eyelid_y_slid_l.value = y_value
		eyelid_x_slid_l.value = x_value
		mouth_x_slid.value = x_value
		mouth_y_slid.value = y_value

		_set_skin_color(0)
var all_info = []
func _next():
	
	all_info+= [f_eyes_id_l,f_eyes_id_r, f_eyelid_id, f_head_id, f_nose_id, f_skin_id]
	_exacute_all_info(all_info)
	#await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://body_render.tscn")
#i love the book of mormon let it bring me higher to tehj light jesus is myu sname john sdmith or somthing
