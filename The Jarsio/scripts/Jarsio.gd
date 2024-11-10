extends Node3D
signal noise(player)
@onready var j = $Jarsio
@onready var p = $Player
@onready var fa = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _physics_process(delta):
	pass

func _on_audio_stream_player_db(dec):
	var b = j.transform.origin
	var a = p.transform.origin
	var distance = b.distance_to(a)
	var output = clamp((dec*20)/(distance)-0.2, 0, 1)
	if output > 0.1:
		emit_signal("noise", p.global_position)
		#print("found", "/", fa, "/", output)7
		fa = (fa+1)


func _on_area_3d_area_entered(area):
	print(area)
