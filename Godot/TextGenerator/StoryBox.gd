extends Viewport

func _process(_delta):
	if get_node("TextRender"):
		size = get_node("TextRender").rect_size
	pass

