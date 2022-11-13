extends Node2D


export var text_speed = 2;
export(NodePath) onready var text_render = get_node(text_render) as RichTextLabel
var page_to_turn_to = 'Intro'
var placeholder_counter = 0

func _ready():
	text_render.percent_visible = 0;
	GameEvents.connect("turn_page", self,"placeholder_for_animation")
		
func _process(_delta):
	if (!GameState.turning_page):
		var chunk_percentage_value = 0
		if text_render.percent_visible < 1:
			chunk_percentage_value = (text_speed+0.00000001) / text_render.text.length() 
		if text_render.percent_visible <= 1:
			text_render.percent_visible = text_render.percent_visible + chunk_percentage_value;
		if text_render.percent_visible > 1:
			text_render.percent_visible = 1;
	else:
		text_render.percent_visible = 0
	if GameState.current_page.name != page_to_turn_to:
		GameState.turning_page = true
		placeholder_counter = placeholder_counter + 1
		if placeholder_counter > 100:
			GameEvents.emit_signal("change_page",page_to_turn_to)
			placeholder_counter = 0
			GameState.turning_page = false
			
		
func placeholder_for_animation(page):
	print(page)
	page_to_turn_to = page

