extends Window



const TEXT_WINDOW := preload("res://Window Experiments #2/text_window.tscn")

signal CloseAll

func _ready():
	close_requested.connect(close)
	await get_tree().create_timer(3).timeout
	#...
	var goal_window = $/root/Main.place_window(TEXT_WINDOW, 0,0)
	goal_window.position = position + Vector2i(0,size.y+100)
	CloseAll.connect(goal_window.close)
	goal_window.begin("The goal of this game...            \nIs to crash it!            \nGood luck!")
	await get_tree().create_timer(5).timeout
	#...
	title = ""
	var title_string = "*psst*: Press( X ) to close me & skip the intro -->"
	for chr in title_string:
		title = title + chr
		await get_tree().create_timer(0.025).timeout


func close():
	CloseAll.emit()
	queue_free()
