extends Node3D
signal getbattery
@onready  var coords = [
	$"../Location Markers/location1".global_position,
	$"../Location Markers/location2".global_position,
	$"../Location Markers/location3".global_position,
	$"../Location Markers/location6".global_position,
	$"../Location Markers/location8".global_position,
	$"../Location Markers/location9".global_position,
	$"../Location Markers/location12".global_position,
	$"../Location Markers/location13".global_position,
	$"../Location Markers/location18".global_position,
	$"../Location Markers/location20".global_position,
 ]
@onready  var rand
@onready var pos
@onready var dir
# Called when the node enters the scene tree for the first time.
func _ready():
	newpos()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$batteryfloat/AnimationPlayer.play("Cylinder001Action")
	$batteryfloat.rotate_y(0.0069420)


func _on_area_3d_area_entered(area):
	if area.is_in_group("player"):
		self.hide()
		emit_signal("getbattery")

func newpos():
	var rand = Vector3(coords[randi() % coords.size()])
	var pos = Vector3(rand)
	var dir = 1
	self.global_position = pos
