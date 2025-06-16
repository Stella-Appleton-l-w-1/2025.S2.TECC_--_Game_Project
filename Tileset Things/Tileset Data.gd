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
#endregion Tiles

#region Tileset Creation
const ROWS: int = 8
const COLUMNS: int = 8

func make_tset(tile:int):
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

func _ready():
	print_tset(empty_tset)
#endregion TEST

#region Tilesets
enum TSET {
	EMPTY = 0,
	FULL = 1,
	INTRO_WALK = 2,
	INTRO_JUMP = 3,
	
}

var tset_numbers: Dictionary = {
	TSET.EMPTY: empty_tset,
	TSET.FULL: full_tset,
	TSET.INTRO_WALK: intro_walk_tset,
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
#endregion Tilesets

#region Map
## Uses [member tset_numbers].
var tset_map: Array[Array] = [
	[1, 1, 1, 1, 1, 1, 1, 1],
	[1, 2, 0, 0, 0, 0, 0, 1],
	[1, 3, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1, 1],
]
#endregion Map
