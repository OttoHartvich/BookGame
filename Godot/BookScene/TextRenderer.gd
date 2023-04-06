extends RichTextLabel
const component_type= GameEvents.COMPONENT_ENUM.TEXT

func _ready():
	pass
	#connect("reload_component",Callable(self,"handle_reload_component"))

func reload(new_text: String) -> void:
	var text_array = parse_text_to_array(new_text)
	var processed_text_array = prune_page_text(text_array)
	var bbcode_string = repack_text(processed_text_array)
	reload_text(bbcode_string)

func reload_text(new_bbcode: String) -> void:
	clear()
	append_text(new_bbcode)

func repack_text(component_array: Array[String]) -> String:
	var label := ""
	for i in range(0,component_array.size()):
		label += component_array[i]
	return label

func parse_text_to_array(input_text:String) -> Array[String]:
	var result: Array[String] = []
	var index := 0
	var stop_index:=0
	while index < input_text.length():
		if input_text[index] == '[':
			result.append(input_text.substr(stop_index,index-stop_index))
			stop_index = index
			pass
		if input_text[index] == ']':
			result.append(input_text.substr(stop_index,index-stop_index + 1))
			stop_index = index + 1
			pass
		if input_text[index] != ']' and index == input_text.length() - 1:
			result.append(input_text.substr(stop_index,index-stop_index + 1))
		index += 1
	return result

func _on_meta_clicked(meta):
	GameEvents.parseAndEmitSignal(meta)

# ---------------------------
# Process inventory functions
# ---------------------------

func combine_touched_items() -> Array[String]:
	var touched_items = Array(GameState.item_invetory_list)
	touched_items.append_array(GameState.used_item_list)
	return touched_items

func is_element_touched_item(element: String) -> bool:
	if element.begins_with('[url=pickUpItem_'):
		var touched_items = combine_touched_items()
		var element_id = element.replace('[url=pickUpItem_','').replace(']','')
		for item in touched_items:
			if item == element_id:
				return true
	return false

func is_element_triggered_trigger(element: String) -> bool:
	if element.begins_with('[url=trigger_'):
		var triggered_triggers = GameState.triggered_trigger_list
		var element_id = element.replace('[url=trigger_','').replace(']','')
		for trigger in triggered_triggers:
			if trigger == element_id:
				return true
	return false

func find_index_in_to_delete(element:String,to_delete:Array[String]) -> int:
	var i = 0
	while i < to_delete.size():
		if element == to_delete[i]:
			return i
		i += 1
	return -1

func clean_up_array(to_clean: Array[String]) -> Array[String]:
	var result = []
	for element in to_clean:
		if element != "":
			result.append(element)
	return result

func prune_page_text(text_array: Array[String],index := 0, to_delete:Array[String] = []) -> Array[String]:
	if index == text_array.size():
		return text_array
	var current_element = text_array[index]
	var to_delete_result = Array(to_delete)
	var text_array_result = Array(text_array)
	# check if a previous evaluation wants this to be deleted
	var index_in_to_delete = find_index_in_to_delete(current_element,to_delete)
	if index_in_to_delete != -1:
		text_array_result[index] = ''
		to_delete_result[index_in_to_delete] = ''
	# check if element is at item button that needs to be turned off
	if is_element_touched_item(current_element):
		text_array_result[index] = ''
		to_delete_result.append('[/url]')
	if is_element_triggered_trigger(current_element):
		text_array_result[index] = ''
		to_delete_result.append('[/url]')
	# TODO pro Informace -> NPC i locations
	# TODO inverse asi pro veci co maji byt schovany ? To by asi melo byt na konci tech textu
	return prune_page_text(text_array_result,index + 1, to_delete_result)
