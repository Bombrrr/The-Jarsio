extends CharacterBody3D


var SPEED = 3.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $Neck
@onready var camera := $Neck/Camera3D
@onready var fly = false
@onready var up = false
@onready var down = false
@onready var enable = false
@onready var inp = false

func _unhandled_input(event: InputEvent) -> void:
	
	if not enable:
		inpu(event)
	
func inpu(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			if fly: camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-80), deg_to_rad(80))
			else:camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	inp = Input.is_action_just_released("cam")
	if inp:
		if enable:
			enable = false
			SPEED = 6
		else: 
			enable = true
			SPEED = 3
	if not enable:
		tick(delta)
	
func tick(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	var dev = Input.is_action_pressed("dev")
	if dev:
		fly = true
		gravity = 0

	if fly:
		up = Input.is_action_pressed("up")
		if up:
			position.y = position.y+0.05
		down = Input.is_action_pressed("down")
		if down:
			position.y = position.y-0.05
	else: gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if fly:
		var input_dir := Input.get_vector("left", "right", "forward", "back")
		var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
	else:
		var input_dir := Input.get_vector("ph", "ph", "forward", "back")
		var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()



func _on_node_grav():
	fly = false
