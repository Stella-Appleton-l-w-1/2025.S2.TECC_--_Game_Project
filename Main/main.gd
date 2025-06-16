extends Control



var countdown := preload("res://countdown.tscn")
var is_counting_down: bool = false

func _input(event):
	if event is InputEventKey:
		if [KEY_RIGHT, KEY_LEFT, KEY_DOWN, KEY_UP].has(event.keycode) && event.is_pressed() && not(is_counting_down):
			var new_countdown := countdown.instantiate()
			add_child(new_countdown)
			new_countdown.time = 5
			new_countdown.TimeOut.connect(_on_countdown_timeout)
			new_countdown.begin()
			is_counting_down = true


func _on_countdown_timeout():
	is_counting_down = false
	print("Done! :3")
