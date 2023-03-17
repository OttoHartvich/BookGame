extends Node2D

func _ready() -> void:
	GameEvents.emit_signal("on_start_game")

