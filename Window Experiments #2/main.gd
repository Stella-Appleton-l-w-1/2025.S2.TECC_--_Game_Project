extends Control



const BORDER := 40
const TITLE := preload("res://Window Experiments #2/title_card.tscn")

@onready var base_window := $/root

func snap_to_border(window:Window) -> void:
	var pos = window.position
	for n in range(2):
		window.position[n] = clamp(window.position[n], BORDER, base_window.size[n] - window.size[n] - BORDER)


func snap_to_anchor(window:Window, x:int,y:int) -> void:
	window.position.x = clamp((((x+1)/2.) * (base_window.size.x - window.size.x)), BORDER, base_window.size.x - BORDER)
	window.position.y = clamp((((y+1)/2.) * (base_window.size.y - window.size.y)), BORDER, base_window.size.y - BORDER)


func place_window(blueprint:PackedScene, x:int,y:int) -> Window:
	var window: Window = blueprint.instantiate()
	add_child(window)
	snap_to_anchor(window, x, y)
	return window


func _process(_delta):
	for child in get_children():
		if child is Window:
			snap_to_border(child)


func _ready():
	await startup_name_effect()
	place_window(TITLE, 0,0)


func startup_name_effect():
	base_window.title = ""
	var title_string = "Welcome to...!"
	for chr in title_string:
		base_window.title = base_window.title + chr
		await get_tree().create_timer(0.1).timeout
	await get_tree().create_timer(1).timeout
	base_window.title = "[ break ]"
