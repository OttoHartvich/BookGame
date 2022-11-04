extends HBoxContainer

export(NodePath) onready var text_render = get_node(text_render) as RichTextLabel

func _process(_delta):
	if text_render.percent_visible == 1 and !self.is_visible_in_tree(): 
		self.show()
	if text_render.percent_visible != 1 and self.is_visible_in_tree(): 
		self.hide()
	pass
