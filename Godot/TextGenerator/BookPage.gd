extends Spatial

onready var animation_player = $AnimationPlayer
var playing
var was_playing

func _ready():
	GameEvents.connect("turn_page",self,"turn_animation")

func turn_animation(new_page):
	animation_player.play("page_armatureAction002")
	GameState.next_page = new_page

func _process(_delta):
	if animation_player.is_playing():
		playing = true
	if !animation_player.is_playing():
		playing = false

	if playing == false and was_playing ==true:
		GameEvents.emit_signal("change_page",GameState.next_page)

	if animation_player.is_playing():
		was_playing = true
	if !animation_player.is_playing():
		was_playing = false
