extends Node3D

var png_num = 1
# Called when the node enters the scene tree for the first time.
@onready  var model = $model
@onready  var camera = $camer/Camera3D
@onready var anim = $model/walking/AnimationPlayer
var i = 0
var r_go = true
func _ready():
	#await get_tree().create_timer(0.1).timeout

	for m in range(5):
		for i in range(9):
			anim.play(str(i+1))
			await get_tree().create_timer(0.001).timeout
			camera.screenshots("sprite data")
			
			
			#print(i+2)
		anim.play("idle")
		await get_tree().create_timer(0.001).timeout
		camera.screenshots("idle data")
		await get_tree().create_timer(0.001).timeout
		model.rotate_y(deg_to_rad(45))
			#anim.play("1")
			
			
			
		#png_num = camera.get_photo_count()
		
		
		
		#microwave(45)
	_transparent_backround()
var deez_nuts = 0


func microwave(x):
	if r_go:
		r_go = false
		model.rotate_y(deg_to_rad(x))
		camera.screenshots()
		await get_tree().create_timer(0.01).timeout
		r_go = true



var DIR = OS.get_executable_path().get_base_dir()
#var interpreter_path = DIR.plus_file("PythonFiles/venv/bin/python3.10")
#var script_path = DIR.plus_file("PythonFiles/notify.py")
var interpreter_path = ProjectSettings.globalize_path("res://PythonFiles/killme/Scripts/python3.12")
var script_path = ProjectSettings.globalize_path("res://PythonFiles/transpernt backrounds.py")

func _transparent_backround():
	await get_tree().create_timer(0.5).timeout
	#var err = OS.execute(interpreter_path, [script_path,png_num])
	#print("png_count",[script_path,9])
	#print("python file: ",err)
	await get_tree().create_timer(0.5).timeout
	get_parent().get_tree().change_scene_to_file("res://body_render.tscn")
