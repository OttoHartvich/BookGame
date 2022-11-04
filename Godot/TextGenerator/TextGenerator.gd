extends Node2D


export var text_speed = 0.1;
export(NodePath) onready var text_render = get_node(text_render) as RichTextLabel

func _ready():
	text_render.percent_visible = 0;

func _process(_delta):
	if text_render.percent_visible <= 1:
		text_render.percent_visible = text_render.percent_visible + text_speed;
	if text_render.percent_visible > 1:
		text_render.percent_visible = 1;
