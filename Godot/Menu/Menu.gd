extends CanvasLayer

	
func _on_QuitBtn_pressed():
	get_tree().quit()

func _on_StartBtn_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
