extends Node3D
signal gunopen
signal gunclose
signal show
signal hide
signal instahide
@onready var shot = false
@onready var charge = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	shot = Input.is_action_pressed("Shoot")
	if shot:
		charge = clamp(charge + 0.5, 0, 100)
		if charge== 1:
			emit_signal("gunopen")
		if charge > 40:
			emit_signal("show")
	else:
		if charge == 100:
			emit_signal("instahide")
			emit_signal("gunclose")
			charge = 0
		else:
			emit_signal("hide")
		if charge > 0:
			emit_signal("gunclose")
		charge = 0