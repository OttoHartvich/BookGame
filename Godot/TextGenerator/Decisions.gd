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
	var current_page
	for n in StoryJson.Json:
		if n.name == GameState.current_page_name:
			current_page = n

	for n in current_page.decisions:
		var button = Button.new()
		button.text = n.label
		self.add_child(button)
	
