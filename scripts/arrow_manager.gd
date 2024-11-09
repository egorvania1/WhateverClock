extends Node2D
var curDate: Dictionary
var curTime: Dictionary

@onready var hour_arrow: Line2D = $HourArrow
@onready var minutes_arrow: Line2D = $MinutesArrow
@onready var seconds_arrow: Line2D = $SecondsArrow

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	curDate = Time.get_datetime_dict_from_system()
	curTime = Time.get_time_dict_from_system()
	var curHour = curTime["hour"]
	if curHour > 12: curHour - 12
	var curMinutes = curTime["minute"]
	var curSeconds = curTime["second"]
	hour_arrow.rotation_degrees = remap(curHour, 0, 12, 0, 359)
	minutes_arrow.rotation_degrees = remap(curMinutes, 0, 59, 0, 359)
	seconds_arrow.rotation_degrees = remap(curSeconds, 0, 59, 0, 359)
