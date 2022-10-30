extends Sprite3D

onready var drawing_speed = get_parent().text_speed;
onready var text_render = get_node("StoryBox/TextRender");

func _ready():
	texture = $StoryBox.get_texture()
	text_render.percent_visible = 0;
	pass 

func _process(_delta):
	if text_render.percent_visible <= 1:
		text_render.percent_visible = text_render.percent_visible + drawing_speed;
