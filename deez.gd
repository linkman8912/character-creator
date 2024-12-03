
extends EditorPlugin

func _ready():
	var editor_interface = get_editor_interface()  # Get the EditorInterface
	var resource_filesystem = editor_interface.get_resource_filesystem()  # Get the resource filesystem
	
	# Now you can use methods on the resource filesystem to interact with resources.
	# For example, to reload a resource:
	var resource_path = "res://sprite sheets/new.png"
	resource_filesystem.reload(resource_path)
