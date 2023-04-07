extends Node

enum COMPONENT_ENUM {
	INVENTORY,
	TEXT,
	BUTTONS,
	CHARACTER_INFO,
	LOCATION_INFO,
}

var inventory_modals = ["Inventory", "Chart", "Notes"]

signal on_start_game;
signal on_game_over;

signal toPage(pageId:String);
signal changePage(pageId:String);

signal switchInventoryPanel(inventory_modal)

signal pickUpItem(itemId:String);
signal use_item(itemId:String);
signal gain_character_info(infoId:String)
signal gain_location_info(infoId:String)
signal reloadBook;


func parseAndEmitSignal(signalString:String) -> void:
	var stringParsedAsArray = signalString.split("_")
	print("emiting signal: ",stringParsedAsArray[0] ," arguments: ",stringParsedAsArray[1])
	emit_signal(stringParsedAsArray[0],stringParsedAsArray[1])
