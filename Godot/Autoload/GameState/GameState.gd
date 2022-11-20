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
		change_page("Intro")
	GameEvents.connect("change_page", self,"change_page")
	GameEvents.connect("pick_up_item", self,"pick_up_item_to_inventory")
	GameEvents.connect("use_item", self,"use_item_from_inventory")

func change_page(new_page):
	for n in StoryJson.Json:
		if n.name == new_page:
			current_page = n

func pick_up_item_to_inventory(item):
	var item_object = find_item_in_library(item)
	print(item_object)
	player.items.append(item_object)

func use_item_from_inventory(item):
	var i = 0
	while i < player.items.size():
		if player.items[i].id  == item:
			player.items.remove(i)
	
func find_item_in_library(item):
	print(item)
	print(ItemLibrary.library)
	for i in ItemLibrary.library:
		print(i)
		if i.id == item:
			return i
