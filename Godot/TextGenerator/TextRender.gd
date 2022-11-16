extends RichTextLabel

func _ready():
	change_page("")
	GameEvents.connect("change_page", self,"change_page")

func change_page(_page):
	self.percent_visible = 0
	var new_text = parse_text(GameState.current_page.text)
	self.bbcode_text = new_text

func parse_text(text_json_array):
	var text = ""
	for snippet in text_json_array:
		var start_tag = ""
		var end_tag = ""
		if snippet.states:
			start_tag = "[" + snippet.states.default.tag + snippet.states.default.props + "]"
			end_tag = "[/" + snippet.states.default.tag + "]"
		var snippet_text = start_tag + snippet.text + end_tag
		text = text + snippet_text
	print(text)
	return text
