extends Control
@onready var hand = preload("res://Images/han.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	Audio.play_music_level()
	$VBoxContainer/Start.grab_focus()
	Input.set_custom_mouse_cursor(hand, Input.CURSOR_POINTING_HAND, Vector2(10, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_start_pressed():
	pass
	
