extends Control



@onready var base_window: Window = $/root

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
				_:
					print(event.as_text_key_label())
#endregion TEST

