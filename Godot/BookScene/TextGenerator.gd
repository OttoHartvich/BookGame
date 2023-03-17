extends Node2D


@export var text_speed = 2;
@export_node_path("RichTextLabel") var text_render_path
@onready var text_render := get_node(text_render_path) as RichTextLabel
var current_page: BookPage

func _ready():
	text_render.visible_ratio = 0

func _process(_delta):
	if (!GameState.turning_page):
		var chunk_percentage_value = 0
		if text_render.visible_ratio < 1:
			chunk_percentage_value = (text_speed+0.00000001) / text_render.text.length() 
		if text_render.visible_ratio <= 1:
			text_render.visible_ratio = text_render.visible_ratio + chunk_percentage_value;
		if text_render.visible_ratio > 1:
			text_render.visible_ratio = 1;
	else:
		text_render.visible_ratio = 0
