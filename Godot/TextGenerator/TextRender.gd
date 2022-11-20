extends RichTextLabel

var page_state =[]

func _ready():
	change_page("")
	GameEvents.connect("change_page", self,"change_page")
	connect("meta_clicked", self, "handle_click")

func change_page(_page):
	self.percent_visible = 0
	update_text()
	page_state = []

func parse_text(text_json_array):
	var text = ""
	for snippet in text_json_array:
		var start_tag = ""
		var end_tag = ""
		if snippet.states:
			if page_state != [] and page_state.find(snippet.id) != -1:
				start_tag = "[" + snippet.states.inactive.tag.strip_edges(true,true) + snippet.states.inactive.props + "]"
				end_tag = "[/" + snippet.states.inactive.tag + "]"
				print(start_tag,end_tag)
			else: 
				start_tag = "[" + snippet.states.default.tag.strip_edges(true,true) + snippet.states.default.props + "]"
				end_tag = "[/" + snippet.states.default.tag + "]"
				if snippet.states.default.class=="item":
					start_tag = start_tag + "[color=black]"
					end_tag =  "[/color]" + end_tag
			#if item color in item color
		var snippet_text = start_tag + snippet.text + end_tag
		text = text + snippet_text
	return text

func handle_click(action):
	var parsed_action = action.split("_")
	if parsed_action[0] == "item":
		GameEvents.emit_signal("pick_up_item",parsed_action[1])
		page_state.append(parsed_action[1])
	update_text()

func update_text():
	var new_text = parse_text(GameState.current_page.text)
	self.bbcode_text = new_text
