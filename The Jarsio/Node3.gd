extends Node
@onready var d = false
signal grav()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dev = Input.is_action_pressed("dev")
	if dev: d = true
	if d:
		$"../../Jarsio/OmniLight3D".show()
		$"../../Player/OmniLight3D".show()
		$"../../Node/CanvasLayer/Control".hide()
		$"../../Player/Neck/Camera3D/SpotLight3D".hide()
		$"../../Node2/CanvasLayer/HBoxContainer/VBoxContainer/Button3".show()
		$"../../Player/Neck/finalarmt".hide()
		$"../../World/Roof".use_collision = false
		$"../../World/Roof".hide()
func _on_button_3_pressed():
	d = false
	$"../../Jarsio/OmniLight3D".hide()
	$"../../Player/OmniLight3D".hide()
	$"../../Node/CanvasLayer/Control".show()
	$"../../Player/Neck/Camera3D/SpotLight3D".show()
	$"../../Node2/CanvasLayer/HBoxContainer/VBoxContainer/Button3".hide()
	$"../../Player/Neck/finalarmt".show()
	$"../../World/Roof".use_collision = true
	$"../../World/Roof".show()
	emit_signal("grav")
