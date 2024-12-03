@tool
extends EditorPlugin

var plugin

func _enter_tree():
	plugin = load("res://addons/reload_png/reload_png.gd")
	
	print("editor htineonfseklda")
	add_inspector_plugin(plugin)
	get_editor_interface().get_resource_filesystem().scan_sources()







func _exit_tree():
	# Clean-up of the plugin goes here.
	pass

