extends Node
enum COMPONENT_ENUM {
	INVENTORY,
	TEXT,
	BUTTONS,
	CHARACTER_INFO,
	LOCATION_INFO,
}

signal on_start_game;
signal on_game_over;
# Updates the game state
signal change_page(pageId:String);
# Updates the page component using the game state page id
signal reload_page(pageId:String);
signal pick_up_item(itemId:String);
signal use_item(itemId:String);
signal gain_character_info(infoId:String)
signal gain_location_info(infoId:String)
signal reload_component(triggersIds: Array[String],listeners:Array[COMPONENT_ENUM])
