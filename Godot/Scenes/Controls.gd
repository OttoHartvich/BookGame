extends Node

@export_node_path("PopupMenu") var settings_menu

func _input(event):
	if event.is_action_pressed("escape"):
		if !settings_menu.is_visible_in_tree():
			settings_menu.popup_centered()
