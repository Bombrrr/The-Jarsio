extends OmniLight3D
@onready var mat = $"."
@onready var col:int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_pulsehandle_hide():
	col = clamp((col - 3), 0, 700)
	if col == 0:
		hide()


func _on_pulsehandle_show():
	col = clamp((col + 1), 0, 700)
	show()


func _on_pulsehandle_instahide():
	col = 0
	hide()
