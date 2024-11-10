extends SpotLight3D
@onready var turn = 0
@onready var cam = $"../Camera3D".global_rotation.x
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	cam = $"../Camera3D".global_rotation.x
	turn = 0.3*cam
	rotate_x(turn - global_rotation.x)
