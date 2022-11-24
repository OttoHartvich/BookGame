extends Button

export var target_page := ""

func _on_GenericButton_pressed():
	var possible_ending = Library.game_endings.find(target_page)
	if possible_ending != -1:
		GameEvents.emit_signal("game_end", target_page)
	GameEvents.emit_signal("turn_page", target_page)
