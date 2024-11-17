extends CSGSphere3D
@onready var mat = $".".material
@onready var col:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _on_pulsehandle_hide():
	col = clamp((col - 3), 0, 700)
	@warning_ignore("integer_division")
	mat.albedo_color = Color8(0, 255, 255, (round(col/10)))


func _on_pulsehandle_show():
	col = clamp((col + 1), 0, 700)
	@warning_ignore("integer_division")
	mat.albedo_color = Color8(0, 255, 255, (round(col/10)))


func _on_pulsehandle_instahide():
	col = 0
	mat.albedo_color = Color8(0, 255, 255, 0)
