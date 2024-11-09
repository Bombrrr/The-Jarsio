extends Node3D
@onready var animation = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
@warning_ignore("unused_parameter")
func _physics_process(delta):
	var forward = Input.is_action_pressed("forward")
	var backward = Input.is_action_pressed("back")
	var emote = Input.is_action_pressed("emote")
	anim(forward, backward, emote)

func anim(forward, backward, emote):
	if emote:
		animation.play("emote")

	elif forward:
		animation.play("crawl")
		
	elif backward:
		animation.play_backwards("crawl")

	else: 
		animation.play("idle")

