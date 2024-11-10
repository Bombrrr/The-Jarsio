extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/VBoxContainer/No.grab_focus()
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	var exit = Input.is_action_pressed("exit")
	if exit:
		get_tree().change_scene_to_file("res://menu.tscn")


func _on_no_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_yes_pressed():
	get_tree().quit()
