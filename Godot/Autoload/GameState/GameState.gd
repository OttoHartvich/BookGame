extends Node

var current_page
var next_page
var player = {
	"items":[
		#{
		#	"id": string
		#	"label": string
		#}
	],
	"health":3
}
var turning_page = false

func _ready():
	if current_page == null:
		current_page = DataManager.load_current_page_data()
	GameEvents.connect("change_page",Callable(self,"change_page"))
	GameEvents.connect("pick_up_item",Callable(self,"pick_up_item_to_inventory"))
	GameEvents.connect("use_item",Callable(self,"use_item_from_inventory"))
	GameEvents.connect("game_end",Callable(self,"switch_to_end_screen"))

func initiate_game_state():
	
func change_page(pageId):
	current_page = DataManager.load

func pick_up_item_to_inventory(item):
	var item_object = find_item_in_library(item)
	player.items.append(item_object)

func use_item_from_inventory(item):
	var i = 0
	while i < player.items.size():
		if player.items[i].id  == item:
			player.items.remove(i)
	
func find_item_in_library(item):
	for i in Library.item_library:
		if i.id == item:
			return i

func switch_to_end_screen(reason):
	get_tree().change_scene_to_file("res://Scenes/" + reason + ".tscn")
