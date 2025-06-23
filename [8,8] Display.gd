extends TextureRect



func _update_screen(tset:Array[Array], player_pos:Vector2i):
	var new_screen := Image.create(8,8, false, Image.FORMAT_RGBA8)
	for Y in range(tset.size()):
		for X in range(tset[Y].size()):
			new_screen.set_pixel(X,Y, dummy_data.get_color(tset[Y][X]))
	new_screen.set_pixelv(player_pos, Color(0,1,1))
	texture = ImageTexture.create_from_image(new_screen)

@onready var dummy_data := TilesetData.new()

func _ready():
	var tset_pos = Vector2i(1,0)
	var tset_int = dummy_data.get_tset_int(tset_pos)
	_update_screen(dummy_data.get_tset(tset_int), dummy_data.get_tset_spawn_pos(tset_int))
