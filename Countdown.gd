extends Window



var tree: SceneTree
var time: int = 3
signal TimeOut

func _enter_tree():
	visible = false
	tree = get_tree()


func begin():
	visible = true
	for sec_num in range(time):
		print_to_window(str(time-sec_num))
		await tree.create_timer(1).timeout
	print_to_window(str(0))
	TimeOut.emit()
	queue_free()


func print_to_window(text:String) -> void:
	$"Control/Label".text = text
