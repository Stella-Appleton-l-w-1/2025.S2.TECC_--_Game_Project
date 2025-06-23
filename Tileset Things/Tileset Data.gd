class_name TilesetData extends Node
## Note: In most members of this class, "Tileset" has been shortened to "tset".


#region Tiles
enum TILE { ## Determines what the numbers in tilesets mean.
	EMPTY = 0, ## Nothing. Player can exist here.
	FULL = 1, ## A wall or floor block. Player cannot exist here.
	CREATE = 2, ## Player's respawn point.
	DESTROY = 3, ## Teleports Player to CREATE.
	WALK = 4, ## Converts Player to "walk mode".
	JUMP = 5, ## Converts Player to "jump mode".
	TURN0 = 6, ## Acts like EMPTY when TurnerValue is false, and FULL otherwise.
	TURN1 = 7, ## Acts like EMPTY when TurnerValue is true, and FULL otherwise.
	TURNER = 8, ## Sets TurnerValue to not(TurnerValue).
}

func get_color(tile:TILE) -> Color:
	match tile:
		TILE.EMPTY:
			return Color(1,1,1)
		TILE.FULL:
			return Color(0.2,0.15,0)
		TILE.CREATE:
			return Color(0.7,1,1)
		TILE.DESTROY:
			return Color(0.5,0,0)
		TILE.WALK:
			return Color(0.9,1,1)
		TILE.JUMP:
			return Color(0.9,1,0.9)
		TILE.TURN0:
			return Color(1,0.5,0.5)
		TILE.TURN1:
			return Color(0.5,0.5,1)
		TILE.TURNER:
			return Color(0.5,0,0.5)
		_:
			return Color(1,1,1,0)
#endregion Tiles

#region Tileset Creation
const ROWS: int = 8
const COLUMNS: int = 8

func make_tset(tile:TILE):
	var new_tset: Array[Array] = []
	var new_row: Array[int] = []
	new_row.resize(COLUMNS)
	new_row.fill(tile)
	new_tset.resize(ROWS)
	new_tset.fill(new_row)
	return new_tset
#endregion Tileset Creation

#region TEST
func print_tset(tset):
	var array_string: String = str(tset)
	var tx: String = " "
	var bra: bool = false
	for ch in array_string:
		tx = tx + ch
		if (bra == true && ch == ","):
			print(tx)
			tx = " "
		bra = true if ch == "]" else false
	print(tx)


var current_tset_pos := Vector2i(1,0)
var moved_this_frame := false

func _ready():
	print("MAP:")
	print_tset(tset_map)
	print("@(1,0):")
	print_tset(get_tset_from_pos(current_tset_pos))


func _process(_delta):
	moved_this_frame = false


func _input(event):
	if moved_this_frame: return
	var move_dir := Vector2i(0,0)
	if event is InputEventKey:
		if event.is_pressed:
			if event.keycode == KEY_RIGHT:
				move_dir.x +=1
			if event.keycode == KEY_LEFT:
				move_dir.x -=1
			if event.keycode == KEY_DOWN:
				move_dir.y +=1
			if event.keycode == KEY_UP:
				move_dir.y -=1
	if move_dir != Vector2i(0,0):
		current_tset_pos += move_dir
		print("@", current_tset_pos, ":")
		print_tset(get_tset_from_pos(current_tset_pos))
		moved_this_frame = true
#endregion TEST

#region Tilesets
enum TSET {
	EMPTY = 0,
	FULL = 1,
	INTRO_WALK = 2,
	INTRO_JUMP = 3,
}

var tset_numbers: Dictionary = {
	TSET.EMPTY: &"empty_tset",
	TSET.FULL: &"full_tset",
	TSET.INTRO_WALK: &"intro_walk_tset",
	TSET.INTRO_JUMP: &"intro_jump_tset",
}

var empty_tset: Array[Array]:
	get:
		return make_tset(TILE.EMPTY)

var full_tset: Array[Array]:
	get:
		return make_tset(TILE.FULL)

var intro_walk_tset: Array[Array] = [
	[1, 1, 1, 1, 1, 1, 1, 1],
	[1, 7, 0, 7, 7, 7, 0, 1],
	[1, 6, 0, 6, 6, 6, 8, 1],
	[1, 3, 0, 3, 1, 1, 1, 1],
	[1, 0, 0, 0, 1, 2, 0, 1],
	[1, 0, 0, 0, 1, 1, 0, 1],
	[1, 7, 1, 0, 0, 0, 0, 1],
	[1, 4, 1, 1, 1, 1, 1, 1],
]

var intro_jump_tset: Array[Array] = [
	[1, 0, 1, 0, 0, 0, 0, 0],
	[1, 5, 1, 0, 0, 0, 0, 0],
	[1, 0, 0, 0, 0, 0, 0, 0],
	[1, 0, 0, 0, 0, 0, 0, 0],
	[1, 2, 0, 0, 0, 0, 0, 0],
	[1, 1, 1, 0, 0, 0, 1, 1],
	[1, 1, 1, 0, 0, 0, 1, 1],
	[1, 1, 1, 3, 3, 1, 1, 1],
]

func get_tile_int(tset_int:int, tile_pos:Vector2i) -> int:
	var tset: Array[Array] = tset_numbers[tset_int]
	var column: int = tile_pos.x
	var row: int = tile_pos.y
	return tset[row][column]
#endregion Tilesets

#region Map
## Uses [member tset_numbers].
var tset_map: Array[Array] = [
	[1, 2, 1, 1, 1, 1, 1, 1],
	[1, 3, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1, 1],
]

func get_tset_int(tset_pos:Vector2i) -> int:
	var column: int = tset_pos.x
	var row: int = tset_pos.y
	return tset_map[row][column]


func get_tset(tset_int:int) -> Array[Array]:
	return get(tset_numbers[tset_int])


func get_tset_spawn_pos(tset_int:int) -> Vector2i:
	var tset := get_tset(tset_int)
	
	var row_num: int = 0
	var tile_num: int = 0
	for row in tset:
		var found: bool = false
		
		
		for tile in row:
			if tile == TILE.CREATE:
				found = true
				break
			tile_num +=1
		if found: break
		tile_num = 0
		row_num +=1
		if row_num > 7:
			row_num = 1
			tile_num = 1
	
	return Vector2i(tile_num, row_num)


func get_tset_from_pos(pos:Vector2i) -> Array[Array]:
	return get_tset(get_tset_int(pos))
#endregion Map
