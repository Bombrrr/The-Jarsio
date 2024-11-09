extends Node3D
var cam

# Called when the node enters the scene tree for the first time.
func _ready():
	cam = get_viewport().get_camera_3d()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Marker = cam.unproject_position(self.global_transform.origin)
	$origin.global_position = Marker
