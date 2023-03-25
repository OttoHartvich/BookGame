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


# the incoming string should be of this format:
# id_signalName_argument0_argument1_...
# the return object looks like this:
#{
# id: String
# signalName: String
# arguments: Array[String]
#}
func parseAndEmitSignal(signalString:String) -> void:
	var result: Dictionary = {}
	var stringParsedAsArray = signalString.split("_")
	result.target_id = stringParsedAsArray[0]
	result.source_id = stringParsedAsArray[1]
	result.signal_name = stringParsedAsArray[2]
	result.arguments = []
	var i = 3
	while i < stringParsedAsArray.size():
		result.arguments.append(stringParsedAsArray[i])
		i+=1
	emit_signal(result.signal_name,result.target_id,result.source_id,result.arguments)
