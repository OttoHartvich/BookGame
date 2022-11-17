extends RichTextLabel

func _ready():
	
	GameEvents.connect("pick_up_item", self,"update_bbc_text")
	GameEvents.connect("use_item", self,"update_bbc_text")
	
func update_bbc_text(_item):
	var text = array_to_string(GameState.player.items)
	self.bbcode_text = text
	print(self.bbcode_text)

func array_to_string(arr: Array) -> String:
	var s = ""
	for i in arr:
		s += String(i) + ", "
	return s
