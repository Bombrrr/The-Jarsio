extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/return.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass
