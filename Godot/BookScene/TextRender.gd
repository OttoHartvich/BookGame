extends RichTextLabel

func _ready():
	connect("meta_clicked",Callable(self,"handle_click"))
func parse_textChunk(textChunk:TextChunk) -> String:
	var result = ""
	var tagArray = textChunk.tags 
	return result
func change_page(page:BookPage):
	var textArray = page.text
	update_text()

func parse_text(text_json_array):
	var text = "TESTTEST"
	return text

func handle_click(action):
	var parsed_action = action.split("_")
	if parsed_action[0] == "item":
		GameEvents.emit_signal("pick_up_item",parsed_action[1])
	update_text()

