extends Node3D
signal gunopen
signal gunclose
signal show
signal hide
signal instahide
signal nobat
@onready var shot = false
@onready var fired = false
@onready var charge = 0
@onready var battery = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	shot = Input.is_action_pressed("charge")
	if shot:
		if battery > 0:
			charge = clamp(charge + 0.5, 0, 100)
			if charge== 1:
				emit_signal("gunopen")
			if charge > 40:
				emit_signal("show")
			fired = Input.is_action_just_released("Shoot")
			if charge == 100 and fired:
				emit_signal("instahide")
				emit_signal("gunclose")
				charge = 0
				battery = battery - 1
		else:
			emit_signal("hide")
			if charge > 0:
				emit_signal("gunclose")
			charge = 0
			emit_signal("nobat")
	else:
		emit_signal("hide")
		if charge > 0:
			emit_signal("gunclose")
		charge = 0


func _on_battery_getbattery():
	battery = battery + 1
