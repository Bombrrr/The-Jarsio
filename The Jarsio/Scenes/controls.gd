extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$"HBoxContainer/Control name/return".grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var exit = Input.is_action_pressed("exit")
	if exit:
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
