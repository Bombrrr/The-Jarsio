extends ProgressBar
@onready var val = 5

func _on_audio_stream_player_db(dec):
	val = clamp(dec*100, 5, 100)
	value = val
