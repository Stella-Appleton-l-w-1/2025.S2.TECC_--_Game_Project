extends Node


@onready var tset_data: TilesetData = TilesetData.new()
var prev_pos: Array[Vector2i] = [Vector2i(1,1), Vector2i(1,1)]
var next_pos: Array[Vector2i] = [Vector2i(1,1), Vector2i(1,1)]
var spawn_pos: Vector2i = Vector2i(1,1)


func _update():
	
	
	
	prev_pos = next_pos
	ViewUpdate.emit(prev_pos, 

signal ViewUpdate(tset:Array[Array], player_pos:Vector2i)



func get_next_pos(dir:Vector2i):
	next_pos[1] = prev_pos[1] + dir
	#region Moving to the next tileset
	if next_pos[1].x > 7:
		next_pos[1].x -=8
		next_pos[0].x +=1
	elif next_pos[1].x < 0:
		next_pos[1].x +=8
		next_pos[0].x -=1
	if next_pos[1].y > 7:
		next_pos[1].y -=8
		next_pos[0].y +=1
	elif next_pos[1].y < 0:
		next_pos[1].x +=8
		next_pos[0].y -=1
	#endregion Moving to the next tileset


var move_dir: Vector2i = Vector2i(0,0)

func _controller_input(dir:Vector2i):
	move_dir = dir

func tile_logic(tile:TilesetData.TILE):
	match tile:
		TilesetData.TILE.EMPTY:
			pass
		TilesetData.TILE.FULL:
			next_pos = prev_pos
		TilesetData.TILE.CREATE:
			pass
		TilesetData.TILE.DESTROY:
			next_pos = 
		TilesetData.TILE.WALK:
			pass#TBD
		TilesetData.TILE.JUMP:
			pass#TBD
		TilesetData.TILE.TURN0:
			pass#TBD
		TilesetData.TILE.TURN1:
			pass#TBD
		TilesetData.TILE.TURNER:
			pass#TBD
