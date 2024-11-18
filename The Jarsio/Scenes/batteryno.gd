extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pulsehandle_nobat():
	self.show()
	$Timer.start(0.25)


func _on_timer_timeout():
	self.hide()
