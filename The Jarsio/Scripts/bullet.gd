extends RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	self.queue_free()


func _on_area_3d_area_entered(area):
	if area.is_in_group("monster"):
		print("monster")
		self.queue_free()
