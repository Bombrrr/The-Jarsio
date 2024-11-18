extends Button
@onready var toggle = false


func _on_pressed():
	if toggle:
		toggle = false
		text = ("the JARSIO")
	else:
		toggle = true
		text = ("the JARRED")
