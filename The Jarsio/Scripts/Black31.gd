extends Sprite2D

@onready var opac = 1
@onready var fad = true
@onready var fadd = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fadd:
		fadeout()
	if fad:
		fadein()
	self.modulate.a = opac
		


func fadein():
	opac = opac - 0.02
	if opac <= 0:
		fad = false

func fadeout():
	opac = opac + 0.02
	if opac >= 1:
		fadd = false
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
		get_tree().paused = false

func _on_button_2_pressed():
	fadd = true
	fad = false
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
