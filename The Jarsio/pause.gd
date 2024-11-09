extends Node


# Called when the node enters the scene tree for the first time.
func _ready(): $CanvasLayer.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	var exit = Input.is_action_pressed("exit")
	if exit:
		$CanvasLayer.show()
		$CanvasLayer/HBoxContainer/VBoxContainer/Button.grab_focus()
		get_tree().paused = true

func _on_button_pressed(): 
		$CanvasLayer.hide()
		get_tree().paused = false
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_button_2_pressed():
		get_tree().change_scene_to_file("res://menu.tscn")
		get_tree().paused = false
