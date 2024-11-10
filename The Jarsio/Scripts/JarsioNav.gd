extends CharacterBody3D
@onready var nav = $NavigationAgent3D
@onready var speed = 2
@onready var tim = 1
@onready var heard = 10
@onready var xmin = -10
@onready var xmax = 10
@onready var zmin = -15
@onready var zmax = 15
@onready var randpos = Vector3(randf_range(xmin, xmax), position.y, randf_range(zmin, zmax))
# Called when the node enters the scene tree for the first time.
func _ready():
	time()

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
		if(abs(randpos.x - global_position.x) <= 0.5 and abs(randpos.z - global_position.z) <=0.5 or tim <= 0 ):
			randpos = Vector3(randf_range(xmin, xmax), position.y, randf_range(zmin, zmax))
			time()
	else:
		if(abs(randpos.x - global_position.x) <= 1 and abs(randpos.z - global_position.z) <= 1 or tim <= 0 ):
			randpos = Vector3(randf_range(xmin, xmax), position.y, randf_range(zmin, zmax))
			time()

func time():
	$Timer.start()
	tim = 1

@warning_ignore("unused_parameter")
func _on_area_3d_area_entered(area):
	randpos = Vector3(randf_range(xmin, xmax), position.y, randf_range(zmin, zmax))

func _on_world_noise(player):
	heard = 1
	randpos = player


func _on_timer_timeout():
	tim = 0
