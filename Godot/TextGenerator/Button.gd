extends Button

export(NodePath) onready var parent = get_node(parent) as Spatial

func _on_GoTo1_pressed() -> void:
	print("leaving ... ",parent.get_name())
	GameEvents.emit_signal("change_page","FirstRoom")
	parent.queue_free()
	pass
