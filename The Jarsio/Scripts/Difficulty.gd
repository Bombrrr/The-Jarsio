extends Button

@onready var mode = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = ("beginner mode")

# Sets mode variable and text when you press the button
func _on_pressed():
	mode = mode+1
	if mode == 6:
		mode = 1

	if mode == 1:
		self.text = ("beginner mode")
	elif mode == 2:
		self.text = ("casual mode")
	elif mode == 3:
		self.text = ("professional mode")
	elif mode == 4:
		self.text = ("nightmare mode")
	else:
		self.text = ("insane mode")
