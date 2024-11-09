extends AudioStreamPlayer
signal db(dec)
var record_bus_index: int

func _ready() -> void:
	record_bus_index = AudioServer.get_bus_index('Record')
	
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	var sample =AudioServer.get_bus_peak_volume_left_db(record_bus_index, 0)
	var linear_sample = db_to_linear(sample)
	emit_signal("db", linear_sample)
	#print(linear_sample)
