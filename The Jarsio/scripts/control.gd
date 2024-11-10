extends Control
@onready var hand = preload("res://han.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()
	Input.set_custom_mouse_cursor(hand, Input.CURSOR_POINTING_HAND, Vector2(10, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _on_start_pressed():
	pass
	
