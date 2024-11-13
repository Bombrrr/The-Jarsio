extends Node

@onready var mode = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Sets mode variable and text when you press the button
func _on_pressed():
	mode = mode+1
	if mode == 6:
		mode = 1

	if mode == 1:
		$"../VBoxContainer/Difficulty".text = ("beginner mode")
	elif mode == 2:
		$"../VBoxContainer/Difficulty".text = ("casual mode")
	elif mode == 3:
		$"../VBoxContainer/Difficulty".text = ("professional mode")
	elif mode == 4:
		$"../VBoxContainer/Difficulty".text = ("nightmare mode")
	else:
		$"../VBoxContainer/Difficulty".text = ("insane mode")
