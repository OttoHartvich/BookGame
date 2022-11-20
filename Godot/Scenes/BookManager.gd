extends Node
onready var book = $Book

var is_mouse_pressed = false
var mouse_coor_when_pressed 
var book_coor_when_pressed

func _ready():
	set_process_input(true)
	
func _physics_process(_delta):
	if Input.is_action_pressed("left_click"):
		if is_mouse_pressed == false:
			mouse_coor_when_pressed = get_viewport().get_mouse_position()
			book_coor_when_pressed = book.global_position
			is_mouse_pressed = true
		var active_mouse_coor = get_viewport().get_mouse_position()
		book.global_position = book_coor_when_pressed + (active_mouse_coor - mouse_coor_when_pressed)
	else: 
		is_mouse_pressed = false
		book_coor_when_pressed = false
