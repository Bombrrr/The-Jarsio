extends CharacterBody3D
@onready var rand
@onready var nav = $NavigationAgent3D
@onready var speed = 2
@onready var tim = 1
@onready var loc = Vector3(global_position)
@onready var heard = 10
@onready var randpos
@onready  var coords = [
	$"../Location Markers/location1".global_position,
	$"../Location Markers/location2".global_position,
	$"../Location Markers/location3".global_position,
	$"../Location Markers/location4".global_position,
	$"../Location Markers/location5".global_position,
	$"../Location Markers/location6".global_position,
	$"../Location Markers/location7".global_position,
	$"../Location Markers/location8".global_position,
	$"../Location Markers/location9".global_position,
	$"../Location Markers/location10".global_position,
	$"../Location Markers/location11".global_position,
	$"../Location Markers/location12".global_position,
	$"../Location Markers/location13".global_position,
	$"../Location Markers/location14".global_position,
	$"../Location Markers/location15".global_position,
	$"../Location Markers/location16".global_position,
	$"../Location Markers/location17".global_position,
	$"../Location Markers/location18".global_position,
	$"../Location Markers/location19".global_position,
	$"../Location Markers/location20".global_position,
	$"../Location Markers/location21".global_position,
 ]
# Called when the node enters the scene tree for the first time.
func _ready():
	time()
	rand = coords[randi() % coords.size()]
	randpos = Vector3(rand.x, position.y, rand.y)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	mov(delta)
	var direction = nav.get_next_path_position()-global_position
	direction = direction.normalized()
	velocity = velocity.lerp(direction*speed, delta*10)
	move_and_slide()

@warning_ignore("unused_parameter")
func mov(delta):
	look_at(global_transform.origin + velocity)
	nav.target_position = randpos
	if heard == 1:
		if(abs(randpos.x - global_position.x) <= 1 and abs(randpos.z - global_position.z) <=1 or tim <= 0 ):
			rand = coords[randi() % coords.size()]
			randpos = Vector3(rand.x, position.y, rand.y)
			time()
	else:
		if(abs(randpos.x - global_position.x) <= 1 and abs(randpos.z - global_position.z) <= 1 or tim <= 0 ):
			rand = coords[randi() % coords.size()]
			randpos = Vector3(rand.x, position.y, rand.y)
			time()

func time():
	$Timer.start()
	tim = 1

@warning_ignore("unused_parameter")
func _on_area_3d_area_entered(area):
	rand = coords[randi() % coords.size()]
	randpos = Vector3(rand.x, position.y, rand.y)

func _on_world_noise(player):
	heard = 1
	randpos = player


func _on_timer_timeout():
	if(abs(loc.x - global_position.x) <= 1 and abs(loc.z - global_position.z) <=1):
		tim = 0
	else: loc = Vector3(global_position)
