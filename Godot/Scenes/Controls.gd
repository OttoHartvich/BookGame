extends Node

export(NodePath) onready var settings_menu = get_node(settings_menu) as PopupMenu

func _input(event):
	if event.is_action_pressed("escape"):
		if !settings_menu.is_visible_in_tree():
			settings_menu.popup_centered()
