extends Control



@onready var base_window: Window = $/root
var screen_size: Vector2i:
	get:
		return DisplayServer.screen_get_size(
			DisplayServer.window_get_current_screen()
		)

#region TEST
@onready var saved_size: Vector2i = base_window.size

func _input(event):
	if event is InputEventKey:
		if event.is_pressed() == true:
			match event.keycode:
				KEY_SPACE:
					print(base_window.size)
				KEY_F:
					base_window.size = saved_size
				KEY_J:
					saved_size = base_window.size
				KEY_S:
					print(screen_size)
				KEY_W:
					add_child(Window.new())
				_:
					print(event.as_text_key_label())
#endregion TEST

func _process(_delta):
	for child in get_children():
		if child is Window:
			snap_to_borders(child)


const BORDER_SIZE: int = 40

func snap_to_borders(child):
	for n in range(2):
		if child.size[n] > base_window.size[n] - 2*BORDER_SIZE:
			child.size[n] = base_window.size[n] - 2*BORDER_SIZE
		if child.position[n] < BORDER_SIZE:
			child.position[n] = BORDER_SIZE
		if child.position[n] + child.size[n] > base_window.size[n] - BORDER_SIZE:
			child.position[n] = base_window.size[n] - child.size[n] - BORDER_SIZE
