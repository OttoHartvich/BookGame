extends Viewport

export(NodePath) onready var container = get_node(container) as MarginContainer

func _on_ready():
	size = container.rect_size
	pass

func _process(_delta):
	size.x = container.rect_size.x
	pass

