extends Node3D
@onready var shot = false
@onready var charge = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shot = Input.is_action_pressed("Shoot")
	if shot:
		charge = charge + 1
	else:
		if charge == 120:
			print("hi") 
		charge = 0
	
