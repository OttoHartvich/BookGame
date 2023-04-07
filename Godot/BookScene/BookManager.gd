extends Control

@export var text_speed = 0.05;

@export_node_path("VBoxContainer") var page_button_container_path
@onready var page_button_container := get_node(page_button_container_path) as VBoxContainer
@export_node_path("RichTextLabel") var text_renderer_path
@onready var text_renderer := get_node(text_renderer_path) as RichTextLabel
@export_node_path("Control") var inventory_panel_path
@onready var inventory_panel := get_node(inventory_panel_path) as Control
@export_node_path("Control") var chart_panel_path
@onready var chart_panel := get_node(chart_panel_path) as Control
@export_node_path("Control") var notes_panel_path
@onready var notes_panel := get_node(notes_panel_path) as Control
var page_button_scene := preload("res://BookScene/Components/PageButton.tscn")

@onready var inventory_modal_nodes: Array[Control] = [inventory_panel, chart_panel, notes_panel]
#@export_node_path("RichTextLabel") var buttons_path
#@onready var buttons := get_node(buttons_path) as GridContainer

var current_page: BookPage

func _ready():
	text_renderer.visible_ratio = 0
	GameEvents.connect("changePage",Callable(self,"change_page"))
	GameEvents.connect("reloadBook",Callable(self,"reload_book"))
	GameEvents.connect("switchInventoryPanel",Callable(self,"switch_inventory_panel"))

func switch_inventory_panel(modal_index):
	var index = 0
	for node in inventory_modal_nodes:
		if index == modal_index:
			node.visible = true
		else:
			node.hide()
		index += 1

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
