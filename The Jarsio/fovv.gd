extends HSlider
signal fov(fo)
@onready var sma = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	
	if sma: emit_signal("fov", 169)
	else: emit_signal("fov", value)
