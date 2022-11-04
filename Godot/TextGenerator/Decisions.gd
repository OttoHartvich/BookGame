extends HBoxContainer

export(NodePath) onready var text_render = get_node(text_render) as RichTextLabel


func _process(_delta):
	if text_render.percent_visible == 1 and !self.is_visible_in_tree(): 
		self.show()
		recreate_buttons()
	if text_render.percent_visible != 1 and self.is_visible_in_tree(): 
		self.hide()
	pass

func recreate_buttons() -> void:
	#clean old buttons
	for n in self.get_children():
		self.remove_child(n)
		n.queue_free()

	#look for new page info
	for n in GameState.current_page.decisions:
		var button = load("res://Resources/GenericButton.tscn").instance()
		button.text = n.label
		button.target_page = n.target_page
		self.add_child(button)
