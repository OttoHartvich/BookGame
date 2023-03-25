extends Node

var current_page_id: String
var item_invetory_list: Array[String]
var used_item_list: Array[String]
var character_information_list: Array[String]
var location_information_list: Array[String]
# kdyz se vytrigeruje event tak by to melo pridat tady do array, zaroven by ten event asi mel obsahovat origin i cil
var triggered_id_list: Array[String]
# var hidden_trigger_list: Array[String] Could work just like inventory and be sent along side the item ids for signals

func _ready():
	load_game_state()
	if current_page_id == '':
		current_page_id = 'Introduction'
	print(current_page_id)
	# currently loads before page so doesnt trigger signals etc
	GameEvents.connect("on_start_game",Callable(self,"on_start_game"))
	GameEvents.connect("change_page",Callable(self,"change_page"))
	GameEvents.connect("pick_up_item",Callable(self,"pick_up_item_to_inventory"))
	GameEvents.connect("use_item",Callable(self,"use_item_from_inventory"))

func on_start_game() -> void:
	change_page(current_page_id)

func load_game_state() -> void:
	print("loading game state ...")
	var saved_game_data = DataManager.load_save_data()
	var keys = saved_game_data.keys()
	var values = saved_game_data.values()
	for i in range(keys.size()):
		var key = keys[i]
		var value = values[i]
		set(key,value)

func save_game_state() -> void:
	print("saving game ...")
	var property_list := {
		"current_page_id": current_page_id,
		"item_invetory_list": item_invetory_list,
		"used_item_list": used_item_list,
		"character_information_list": character_information_list,
		"location_information_list": location_information_list
	}
	DataManager.save_game(property_list)

func change_page(pageId: String) -> void:
	print("changing page to: ", pageId)
	current_page_id = pageId
	GameEvents.emit_signal('reload_page',pageId)
	save_game_state()

func pick_up_item_to_inventory(item_id) -> void:
	print("picking up item: ", item_id)
	item_invetory_list.append(item_id)
	GameEvents.emit_signal('reload_component',[item_id],[GameEvents.COMPONENT_ENUM.INVENTORY,GameEvents.COMPONENT_ENUM.TEXT])
	save_game_state()

func use_item_from_inventory(item_id) -> void:
	var i = 0
	while i < item_invetory_list.size():
		if item_invetory_list[i]  == item_id:
			print("using up item: ", item_id)
			item_invetory_list.remove_at(i)
			used_item_list.append(item_id)
			GameEvents.emit_signal('reload_component',[item_id],[GameEvents.COMPONENT_ENUM.INVENTORY,GameEvents.COMPONENT_ENUM.TEXT,GameEvents.COMPONENT_ENUM.BUTTONS])
			save_game_state()
			return
		else:
			i += 1
