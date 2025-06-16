class_name TilesetData extends Node
## Note: In most members of this class, "Tileset" has been shortened to "tset".


#region Tiles
enum TILE { ## Determines what the numbers in tilesets mean.
	EMPTY, ## Nothing. Player can exist here.
	FULL, ## A wall or floor block. Player cannot exist here.
	CREATE, ## Player's respawn point. Player can exist here.
	DESTROY, ## Teleports Player to CREATE. Player can exist here.
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
var tset_numbers: Dictionary = {
	0: empty_tset,
	1: full_tset,
	2: intro_tset,
}

var empty_tset: Array[Array]:
	get:
		return make_tset(TILE.EMPTY)

var full_tset: Array[Array]:
	get:
		return make_tset(TILE.FULL)

var intro_tset: Array[Array] = [
	[1, 1, 1, 1, 1, 1, 1, 1],
	[1, 2, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1, 1],
]
#endregion Tilesets

#region Map
## Uses [member tset_numbers].
var tset_map: Array[Array] = [
	[1, 1, 1, 1, 1, 1, 1, 1],
	[1, 2, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 0, 0, 0, 0, 0, 0, 1],
	[1, 1, 1, 1, 1, 1, 1, 1],
]
#endregion Map
