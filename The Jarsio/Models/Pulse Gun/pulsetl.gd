extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _on_pulsehandle_gunopen():
	$AnimationPlayer.play("Cylinder005Action")


func _on_pulsehandle_gunclose():
	$AnimationPlayer.play_backwards("Cylinder005Action")
