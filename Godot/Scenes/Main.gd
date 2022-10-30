extends Spatial

func _ready() -> void:
	var err = GameEvents.connect("on_start_game", self, "show")


func show() -> void:
	print("hello i am main");


