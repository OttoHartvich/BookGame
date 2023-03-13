extends RichTextLabel

func _ready():
	change_page("")
	GameEvents.connect("change_page",Callable(self,"change_page"))
	connect("meta_clicked",Callable(self,"handle_click"))

func change_page(_page):
	self.percent_visible = 0
	update_text()

func parse_text(text_json_array):
	var text = ""
	for snippet in text_json_array:
		var start_tag = ""
		var end_tag = ""
		if snippet.states:
			var matching_state = null
			for s in GameState.player.items:
				if snippet.id != null and snippet.id == s.id:
					matching_state = s.id
			if GameState.player.items != [] and matching_state != null:
				start_tag = "[" + snippet.states.inactive.tag.strip_edges(true,true) + snippet.states.inactive.props + "]"
				end_tag = "[/" + snippet.states.inactive.tag + "]"
			else: 
				start_tag = "[" + snippet.states.default.tag.strip_edges(true,true) + snippet.states.default.props + "]"
				end_tag = "[/" + snippet.states.default.tag + "]"
				if snippet.states.default.class = "item":
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
	update_text()

func update_text():
	var new_text = parse_text(GameState.current_page.text)
	self.text = new_text
