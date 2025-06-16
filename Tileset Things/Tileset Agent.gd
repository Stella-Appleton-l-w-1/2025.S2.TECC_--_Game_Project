extends Node
#
#
################################################################
const MAP_SPAWN: Vector2i = Vector2i(1,1)
var tset_spawn: Vector2i = Vector2i(1,1)
#
var tset_pos: Vector2i = Vector2i(0,0)
var tile_pos: Vector2i = Vector2i(0,0)
#
var current_tset: int = 0
var current_tile: int = 0
#
################################################################
func _ready():
	reset_map()
#
#
func reset_map():
	tset_pos = MAP_SPAWN
	reset_tset()
#
#
func reset_tset():
	pass
#
#
################################################################
func _update():
	match player_mode:
		PM.WALK

enum PM {
	WALK,
	JUMP,
}
var player_mode: PM = PM.WALK
