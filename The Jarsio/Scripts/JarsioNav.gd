extends CharacterBody3D

#Declaring the variables
@onready var rand
@onready var nav = $NavigationAgent3D
@onready var speedorig = 2
@onready var speed = speedorig
@onready var tim = 1
@onready var test = true
@onready var loc = Vector3(global_position)
@onready var randpos
@onready var hornscene = preload("res://Scenes/Horn.tscn")
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
	newpos()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mov(delta)

#Moves jarsio toward the chosen position
@warning_ignore("unused_parameter")
func mov(delta):
	look_at(global_transform.origin + velocity)
	nav.target_position = randpos
	
	if(abs(randpos.x - global_position.x) <= 1 and abs(randpos.z - global_position.z) <= 1 or tim <= 0 ):
		newpos()
		
	var direction = nav.get_next_path_position()-global_position
	direction = direction.normalized()
	velocity = velocity.lerp(direction*speed, delta*10)
	move_and_slide()

#Sets a timer for stuck prevention
func time(time):
	$Timer.start(time)
	tim = 1

#Sets chosen position to the player
func _on_world_noise(player):
	randpos = player
	$Timer.start(20)
	tim = 1

#
func _on_timer_timeout():
	if(abs(loc.x - global_position.x) <= 1 and abs(loc.z - global_position.z) <=1):
		tim = 0
	else: loc = Vector3(global_position)

#Detects when the bullet hits the jarsio and makes him run home
func _on_area_3d_area_entered(area):
	if area.is_in_group("bullet"):
		randpos = $"../Location Markers/location14".global_position
		$Timer.stop()
		speed = speedorig * 2
		spawnhorn()

#Chooses a random position from a list of positions
func newpos():
	rand = coords[randi() % coords.size()]
	randpos = Vector3(rand.x, position.y, rand.y)
	speed = speedorig
	time(40)


#Spawns the horn item when you shoot the jarsio
func spawnhorn():
	var horn = hornscene.instantiate()
	add_sibling(horn)
	horn.global_position = self.global_position
	horn.global_position.y = 1
