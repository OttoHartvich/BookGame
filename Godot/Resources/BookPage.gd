extends Spatial

onready var animation_player = $AnimationPlayer

func _ready():
	GameEvents.connect("turn_page",self,"turn_animation")


func turn_animation(new_page):
	animation_player.play("page_armatureAction002")
	GameState.next_page = new_page

func do_thing(hello):
	print("hello",hello)
