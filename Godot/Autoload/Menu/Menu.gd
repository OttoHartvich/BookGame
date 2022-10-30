extends CanvasLayer

func _on_StartBtn_button_up():
	GameEvents.emit_signal("on_start_game")
	print('starting game')
	get_tree().change_scene("res://Main.tscn")



func _on_QuitBtn_button_up():
	get_tree().quit()

