extends Node2D

var p = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_TEST()
var DIR = OS.get_executable_path().get_base_dir()
#var ainterpreter_path = DIR.plus_file("C:/Users/NuVu/Documents/Custom Character Maker/mormon/Scripts/python.exe")
#var bscript_path = DIR.plus_file("res://PythonFiles/test")
#var interpreter_path = ProjectSettings.globalize_path("C:/Users/NuVu/Documents/Custom Character Maker/mormon/Scripts/python.exe")
var interpreter_path = ProjectSettings.globalize_path("c:\\Users\\PROJECT SKULLY\\Documents\\Custom Character Maker\\.venv\\Scripts\\python.exe")
var script_path = ProjectSettings.globalize_path("res://PythonFiles/test")

func _TEST():
	var err = OS.execute(interpreter_path, [script_path,"high"])
	print("png_count",[script_path,9])
	print("python file: ",err)
