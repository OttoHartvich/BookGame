extends Node2D

func _ready() -> void:
	GameEvents.emit_signal("on_start_game")
	var err = GameEvents.connect("on_start_game", self, "show")
	


func show() -> void:
	print("hello i am main");
