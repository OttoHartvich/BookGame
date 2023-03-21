extends Node2D


@export var text_speed = 2;
@export_node_path("RichTextLabel") var text_renderer_path
@onready var text_renderer := get_node(text_renderer_path) as RichTextLabel
@export_node_path("RichTextLabel") var buttons_path
@onready var buttons := get_node(buttons_path) as GridContainer

var current_page: BookPage

func _ready():
	text_renderer.visible_ratio = 0
	GameEvents.connect("reload_page",Callable(self,"reload_page"))

func reload_page(pageId) -> void:
	var new_page = DataManager.load_page_from_library(pageId)
	current_page = new_page
	text_renderer.reload(current_page.text)
	buttons.reload(current_page.buttons)
	# TODO dalsi onload funkce???
	
func _process(_delta):
	# tady vymyslet jak renderovat treba jenom zmenu ?
	if text_renderer.visible_ratio <= 1:
		text_renderer.visible_ratio = text_renderer.visible_ratio + text_speed/100;
	if text_renderer.visible_ratio > 1:
		text_renderer.visible_ratio = 1;
