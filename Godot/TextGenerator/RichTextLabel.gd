extends RichTextLabel

func _ready():
	
	GameEvents.connect("pick_up_item", self,"update_bbc_text")
	GameEvents.connect("use_item", self,"update_bbc_text")
	
func update_bbc_text(_item):
	var text_array =[]
	for item in GameState.player.items:
		if item == null:
			pass
		text_array.append(item.label)
	var text = array_to_string(text_array)
	self.bbcode_text = text

func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += String(i) + ", "
	return s
