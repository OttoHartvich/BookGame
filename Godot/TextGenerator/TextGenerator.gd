extends Node2D


export var text_speed = 2;
export(NodePath) onready var text_render = get_node(text_render) as RichTextLabel

func _ready():
	text_render.percent_visible = 0;

func _process(_delta):
	var chunk_percentage_value = 0
	if text_render.percent_visible < 1:
		chunk_percentage_value = (text_speed+0.00000001) / text_render.text.length() 
	if text_render.percent_visible <= 1:
		text_render.percent_visible = text_render.percent_visible + chunk_percentage_value;
	if text_render.percent_visible > 1:
		text_render.percent_visible = 1;
