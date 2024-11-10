extends Sprite2D
@onready var opac = 1
@onready var fad = true
@onready var fadd = false
@onready var scene = "res://quit.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	fad = true
	self.show()

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if fadd:
		fadeout()
	if fad:
		fadein()
	self.modulate.a = opac
	
	var exit = Input.is_action_pressed("exit")
	if exit:
		scene = "res://Scenes/menu.tscn"
		fadd = true
		fad = false
		


func fadein():
	opac = opac - 0.02
	if opac <= 0:
		fad = false

func fadeout():
	opac = opac + 0.02
	if opac >= 1:
		fadd = false
		get_tree().change_scene_to_file(scene)

func _on_quit_pressed():
	scene = "res://Scenes/quit.tscn"
	fadd = true
	fad = false


func _on_credits_pressed():
	scene = "res://Scenes/credits.tscn"
	fadd = true
	fad = false


func _on_settings_pressed():
	scene = "res://Scenes/settings.tscn"
	fadd = true
	fad = false


func _on_no_pressed():
	scene = "res://Scenes/menu.tscn"
	fadd = true
	fad = false


func _on_return_pressed():
	scene = "res://Scenes/menu.tscn"
	fadd = true
	fad = false


func _on_start_pressed():
	scene = "res://Scenes/main.tscn"
	fadd = true
	fad = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
