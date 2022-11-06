extends Button

export var target_page = ""

func _on_GenericButton_pressed():
	print("emitting signal: ",target_page)
	GameEvents.emit_signal("turn_page", target_page)
