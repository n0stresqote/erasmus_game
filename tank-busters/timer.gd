extends Node2D

var total_time := 180.0 # 3 minutes in seconds
var minutes := 0
var seconds := 0
var msec := 0

func _process(delta: float) -> void:
	total_time -= delta

	if total_time <= 0.0:
		total_time = 0.0
		set_process(false)

	msec = int(fmod(total_time, 1.0) * 100)
	seconds = int(fmod(total_time, 60))
	minutes = int(total_time / 60)

	$Minutes.text = "%02d:" % minutes
	$Seconds.text = "%02d." % seconds
	$Msecs.text = "%02d" % msec

func get_time_formatted() -> String:
	return "%02d:%02d.%02d" % [minutes, seconds, msec]
