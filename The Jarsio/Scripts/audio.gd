extends AudioStreamPlayer

const spooky = preload("res://Audio/menu.mp3")
# Called when the node enters the scene tree for the first time.
func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
	stream = music
	volume_db = volume
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func play_music_level():
	_play_music(spooky)
 
