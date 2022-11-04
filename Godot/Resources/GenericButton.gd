extends Button

export var target_page = ""

func _on_GenericButton_pressed():
	GameEvents.emit_signal("change_page",target_page)
