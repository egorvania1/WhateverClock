extends Control

var time_elapsed := 0.0
var is_paused := true
@onready var timer_label := $VBoxContainer/ActiveTimer
@onready var stop_button :=$VBoxContainer/HBoxContainer/Stop
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !is_paused: 
		time_elapsed += delta
		var seconds = int(time_elapsed)%60
		var minutes = int(time_elapsed)/60
		var hours = int(time_elapsed)/60/60
		timer_label.text = "%02d:%02d:%02d" % [hours, minutes, seconds]

func _on_start_pause_pressed() -> void:
	is_paused = !is_paused
	stop_button.disabled = !stop_button.disabled 

func _on_stop_pressed() -> void:
	time_elapsed = 0.0
	timer_label.text = "00:00:00"
