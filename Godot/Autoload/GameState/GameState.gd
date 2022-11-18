extends Node

var current_page
var next_page
var player = {
	"items":[
	],
	"health":3
}
var turning_page = false

func _ready():
	if current_page == null:
		change_page("Intro")
	GameEvents.connect("change_page", self,"change_page")
	GameEvents.connect("pick_up_item", self,"pick_up_item_to_inventory")
	GameEvents.connect("use_item", self,"use_item_from_inventory")

func change_page(new_page):
	for n in StoryJson.Json:
		if n.name == new_page:
			current_page = n

func pick_up_item_to_inventory(item):
	player.items.append(item)

func use_item_from_inventory(item):
	player.items.erase(item)
