class_name TextWindow extends Window



func _ready():
	close_requested.connect(close)


signal Begun
func begin(text):
	for chr in text:
		$Text.text = $Text.text + chr
		await get_tree().create_timer(0.04).timeout
	Begun.emit()


signal Closing
func close():
	queue_free()
	Closing.emit()
