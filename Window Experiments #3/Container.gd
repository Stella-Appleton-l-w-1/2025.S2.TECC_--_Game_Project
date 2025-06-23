extends Container



var pixel_grid: Array[Array]

func create_pixel_grid(x:int, y:int):
	for child in get_children():
		free()
	var grid = create_array_grid(x,y,0)
	for Y in grid:
		for X in Y:
			X = ColorRect.new()
			add_child(X)
	pixel_grid = grid


func create_array_grid(x:int, y:int, fill) -> Array[Array]:
	@warning_ignore("unassigned_variable")
	var grid: Array[Array]
	grid.resize(y)
	@warning_ignore("unassigned_variable")
	var row: Array
	row.resize(x)
	row.fill(fill)
	grid.fill(row)
	return grid


@onready var stored_size: Vector2 = size

func _process(_delta):
	if size != stored_size:
		stored_size = size
		resize(stored_size)

func resize(to_size:Vector2):
		for Y in range(pixel_grid.size()):
			var pixel_grid_row = pixel_grid[Y]
			for X in range(pixel_grid_row.size()):
				var pixel = pixel_grid_row[X]
				pixel.position.x = to_size.x * X
				pixel.size.x = to_size.x / 8
				pixel.position.y = to_size.y * Y
				pixel.size.y = to_size.y / 8


func _update_pixels(grid):
	for Y in range(pixel_grid.size()):
		var pixel_grid_row = pixel_grid[Y]
		var grid_row = grid[Y]
		for X in range(pixel_grid_row.size()):
			pixel_grid_row[X].color = dummy_data.get_color(grid_row[X])


@onready var dummy_data = TilesetData.new()
func _ready():
	create_pixel_grid(8,8)
	resized.connect(resize(size))
