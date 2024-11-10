extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


func _on_h_slider_fov(fo):
	if fo == 69: set_text("NICE")
	elif fo == 60: set_text("NORMAL")
	elif fo == 169: set_text("What Da Hell")
	else: set_text(str(fo)) 
