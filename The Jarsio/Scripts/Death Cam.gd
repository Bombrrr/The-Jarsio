extends Node3D
@onready var death = false
@onready var animation = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	death = Input.is_action_just_pressed("death")
	if death:
		die()
	if animation:
		$"../Death Cam".set_current(true)


func _on_world_caught():
	die()

func die():
	$".".show()
	animation = true
	$AnimationPlayer.play("L ArmAction")
	$"../Timer".start(6.9)
	$"../../Game UI/CanvasLayer".hide()
