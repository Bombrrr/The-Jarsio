extends Node3D

@onready var bulletspeed = 50
@onready var bulletscene = preload("res://Scenes/bullet.tscn")
@onready var spawn = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pulsehandle_instahide():
	spawnbullet()


func spawnbullet():
	var projectile = bulletscene.instantiate()
	add_sibling(projectile)
	projectile.global_position = self.global_position
	projectile.global_rotation = self.global_rotation
	projectile.linear_velocity = spawn.global_transform.basis.z * -1 * bulletspeed
