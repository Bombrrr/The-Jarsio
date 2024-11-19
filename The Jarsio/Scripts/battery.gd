extends Node3D

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
@onready  var rand = Vector3(coords[randi() % coords.size()])
@onready var pos = Vector3(rand)
@onready var dir = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	self.global_position = pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

