extends Node
onready var book = $Book

var is_mouse_pressed = false
var mouse_pressed_delay = 100
var mouse_coor_when_pressed 
var book_coor_when_pressed

func _ready():
	set_process_input(true)

func _physics_process(_delta):
	if Input.is_action_pressed("left_click") and get_viewport().get_mouse_position():
		if mouse_pressed_delay > 0:
			mouse_pressed_delay -= 1
		else:
			if is_mouse_pressed == false:
				mouse_coor_when_pressed = get_viewport().get_mouse_position()
				book_coor_when_pressed = book.global_position
				is_mouse_pressed = true
			var active_mouse_coor = get_viewport().get_mouse_position()
			book.global_position = book_coor_when_pressed + (active_mouse_coor - mouse_coor_when_pressed)
			if book.scale.x < 1.025:
				book.scale.x = book.scale.x + 0.005
			if book.scale.y < 1.025:
				book.scale.y = book.scale.x + 0.005
	else: 
		is_mouse_pressed = false
		book_coor_when_pressed = false
		if book.scale.x > 1:
			book.scale.x = book.scale.x - 0.005
		if book.scale.y > 1:
			book.scale.y = book.scale.x - 0.005
		mouse_pressed_delay = 10
