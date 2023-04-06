extends Control


@export var text_speed = 0.05;
@export_node_path("RichTextLabel") var text_renderer_path
@export_node_path("VBoxContainer") var page_button_container_path
@onready var page_button_container := get_node(page_button_container_path) as VBoxContainer
@onready var text_renderer := get_node(text_renderer_path) as RichTextLabel
var page_button_scene := preload("res://BookScene/Components/PageButton.tscn")

#@export_node_path("RichTextLabel") var buttons_path
#@onready var buttons := get_node(buttons_path) as GridContainer

var current_page: BookPage

func _ready():
	text_renderer.visible_ratio = 0
	GameEvents.connect("changePage",Callable(self,"change_page"))
	GameEvents.connect("reloadBook",Callable(self,"reload_book"))

#func handle_reload_component(triggersIds: Array[String],listeners:Array[GameEvents.COMPONENT_ENUM]) -> void:
#	var is_valid_listener = listeners.find(component_type)
#	if is_valid_listener == -1:
#		pass
func reload_book() -> void:
	reload_page(GameState.current_page_id)

func change_page(page_id) -> void:
	text_renderer.visible_ratio = 0
	reload_page(page_id)

func reload_page(page_id) -> void:
	var new_page = DataManager.load_page_from_library(page_id)
	current_page = new_page
	text_renderer.reload(current_page.text)
	reload_page_buttons()
# buttons.reload(current_page.buttons)
# TODO dalsi onload funkce???

func reload_page_buttons() -> void:
	wipe_children(page_button_container)
	for button in current_page.buttons:
		if button.id == '':
			create_button(button)
		if GameState.triggered_trigger_list.find(button.id) > -1:
			create_button(button)

func create_button(button_data:PageButton) -> void:
	var new_button = page_button_scene.instantiate()
	new_button.append_text('[url=' + button_data.targetEvent + ']' + button_data.label + '[/url]')
	# zobrazuje se to nekam do pici zase asi
	page_button_container.add_child(new_button)

func wipe_children(node:Node):
	for child in node.get_children():
		child.queue_free()
	pass

func _process(_delta):
	if text_renderer.visible_ratio <= 1:
		text_renderer.visible_ratio = text_renderer.visible_ratio + text_speed;
	if text_renderer.visible_ratio > 1:
		text_renderer.visible_ratio = 1;
