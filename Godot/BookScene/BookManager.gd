extends Control


@export var text_speed = 0.01;
@export_node_path("RichTextLabel") var text_renderer_path
@onready var text_renderer := get_node(text_renderer_path) as RichTextLabel
#@export_node_path("RichTextLabel") var buttons_path
#@onready var buttons := get_node(buttons_path) as GridContainer

var current_page: BookPage

func _ready():
	text_renderer.visible_ratio = 0
	GameEvents.connect("reload_page",Callable(self,"reload_page"))

func reload_page(pageId) -> void:
	var new_page = DataManager.load_page_from_library(pageId)
	print("new page: ",new_page)
	current_page = new_page
	text_renderer.reload(current_page.text)
	#buttons.reload(current_page.buttons)
	# TODO dalsi onload funkce???
	
func _process(_delta):
	if text_renderer.visible_ratio <= 1:
		text_renderer.visible_ratio = text_renderer.visible_ratio + text_speed;
	if text_renderer.visible_ratio > 1:
		text_renderer.visible_ratio = 1;
