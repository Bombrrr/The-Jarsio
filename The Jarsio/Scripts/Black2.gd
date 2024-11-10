extends Sprite2D
@onready var numb = randf_range(0.5,3)
@onready var t = randf_range(0.05,0.1)
@onready var s = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if s:
		numb = randf_range(0.05,10.01)
		$Timer.start(numb)
		s = false
		$Timer2.stop()

func _on_timer_timeout():
	self.hide()
	t = randf_range(0.05,0.1)
	$Timer2.start(t)

func _on_timer_2_timeout():
	self.show()
	s = true
