extends RichTextLabel
const component_type= GameEvents.COMPONENT_ENUM.TEXT

var text_array: Array[String] = []


func _ready():
	pass
	#connect("reload_component",Callable(self,"handle_reload_component"))

func reload(new_text: String) -> void:
	#var itemsInInvetory = GameState.item_invetory_list
	#var usedItems = GameState.used_item_list

	var text_array = parse_text_to_array(new_text)
	# process text array here 
	# TODO !!!!!!!!!!!!!!!!!!!!!!! TODO
	var processed_text_array = text_array
	
	var bbcode_string = repack_text(processed_text_array)
	reload_text(bbcode_string)
	print("current text:",get_parsed_text())
	#text = label

func reload_text(new_bbcode: String) -> void:
	clear()
	append_text(new_bbcode)

# naparsuju si ten string podle tagu vsechno co je uzavreny [] tak bude v array a zaroven i text. regex je zbytecne komplikovany.
func deactivate_item_in_text(id:String,existingText:String) -> void:
	pass

func repack_text(component_array: Array[String]) -> String:
	var label := ""
	for i in range(0,component_array.size()):
		label += component_array[i]
	return label

func parse_text_to_array(input_text:String) -> Array[String]:
	var result: Array[String]
	var index := 0
	var stop_index:=0
	while index < input_text.length():
		print("stop index ", stop_index, " index ", index)
		if input_text[index] == '[':
			result.append(input_text.substr(stop_index,index-stop_index-1))
			stop_index = index - 1
			pass
		if input_text[index] == ']':
			result.append(input_text.substr(stop_index,index-stop_index+1))
			stop_index = index + 1
			pass
		if input_text[index] != ']' and index == input_text.length() - 1:
			result.append(input_text.substr(stop_index,index-stop_index))
		index += 1
	print(result)
	return result

func _on_meta_clicked(meta):
	print("clicked: " , meta)
	GameEvents.parseAndEmitSignal(meta)
	#deactivate_item_in_text(meta,bbcode) # Replace with function body.
