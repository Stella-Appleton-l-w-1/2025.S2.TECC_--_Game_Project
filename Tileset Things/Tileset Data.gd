class_name TilesetData extends Node



#region Tileset Creation
const ROWS: int = 8
const COLUMNS: int = 8
const BASE_TILE: int = 0

var empty_tset: Array[Array]:
	get:
		var new_tset:Array[Array]
		var new_row: Array[int]
		new_row.resize(COLUMNS)
		new_row.fill(BASE_TILE)
		new_tset.resize(ROWS)
		new_tset.fill(new_row)
		return new_tset
#endregion Tileset Creation
