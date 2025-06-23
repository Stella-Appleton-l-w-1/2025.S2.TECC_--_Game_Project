extends Container



var pixel_grid: Array[Array]

func create_pixel_grid(x:int, y:int):
	for child in get_children():
		free()
	var grid = create_array_grid(x,y,0)
	for Y in grid:
		for X in Y:
			X = ColorRect.new()
	pixel_grid = grid


func create_array_grid(x:int, y:int, fill) -> Array[Array]:
	@warning_ignore("unassigned_variable")
	var grid: Array
	grid.resize(y)
	@warning_ignore("unassigned_variable")
	var row: Array
	row.resize(x)
	row.fill(fill)
	grid.fill(row)
	return grid


@onready var stored_size: Vector2 = size

signal SizeUpdate

func _process(_delta):
	if size != stored_size:
		stored_size = size
		resize(stored_size)

func resize(to_size:Vector2):
	pass

func _update_pixels(grid):
	for Y in range(pixel_grid.size()):
		var pixel_grid_row = pixel_grid[Y]
		var grid_row = grid[Y]
		for X in range(pixel_grid_row.size()):
			pixel_grid_row[X].color = get_color(grid_row[X])

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
			return Color(0,0,0)
		TILE.CREATE:
			return Color(0,0.7,0.7)
		TILE.DESTROY:
			return Color(0.5,0,0)
		TILE.WALK:
			return Color(1,0.9,0.9)
		TILE.JUMP:
			return Color(1,0.9,1)
		TILE.TURN0:
			return Color(1,0.5,0.5)
		TILE.TURN1:
			return Color(0.5,0.5,1)
		TILE.TURNER:
			return Color(0.5,0,0.5)
		_:
			return Color(1,1,1,0)
