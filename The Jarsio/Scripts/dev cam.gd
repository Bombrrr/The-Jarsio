extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity: float = 0
@onready var neck := $Neck
@onready var camera := $Neck/Camera3D
@onready var fly = false
@onready var up = false
@onready var down = false
@onready var enable = false
@onready var inp = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			neck.rotate_y(-event.relative.x * 0.01)
			camera.rotate_x(-event.relative.y * 0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

@warning_ignore("unused_parameter")
func _physics_process(delta: float) -> void:
	inp = Input.is_action_just_released("cam")
	if inp:
		if enable:
			enable = false
			$"../Player/Neck/Camera3D".set_current(true)
			self.hide()
			$"../World/Roof".show()
		else: 
			enable = true
			$Neck/Camera3D.set_current(true)
			self.show()
			$"../World/Roof".hide()
			self.global_position = $"../Player".global_position
			$Neck.global_rotation = $"../Player/Neck".global_rotation
			$Neck/Camera3D.global_rotation = $"../Player/Neck/Camera3D".global_rotation
			self.global_position.y = self.global_position.y+1
	if enable:
		enabled()
	
func enabled():
	up = Input.is_action_pressed("up")
	if up:
		position.y = position.y+0.05
	down = Input.is_action_pressed("down")
	if down:
		position.y = position.y-0.05

	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
