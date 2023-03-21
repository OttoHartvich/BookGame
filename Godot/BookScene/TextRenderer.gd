#@export var id := ''
#@export var label := ''
#@export var isVisible := true
#@export var isClickable := false
#@export var tags: Array[String] = []
#@export var eventTargets: Array[EventTarget]

extends RichTextLabel
var current_text: Array[TextChunk] = []

func _ready():
	connect("meta_clicked",Callable(self,"handle_click"))

func reload(new_text: Array[TextChunk]):
	var itemsInInvetory = GameState.item_invetory_list
	var usedItems = GameState.used_item_list
	# TODO vymyslet jak se tohle bude zobrazovat/nezobrazovat
	current_text = new_text

func parse_text_chunks(chunk: TextChunk) -> String:
	var resultStart = ""
	var resultEnd = ""
	if !chunk.isVisible:
		return ""

	for i in chunk.tags.size():
		if i%2:
			resultEnd += chunk.tags[i]
		else:
			resultStart = chunk.tags[i] + resultStart

	if chunk.isClickable:
		for target in chunk.onClickTargets:
			resultEnd += "[/url]"
			resultStart = "[url=" + target + "]" + resultStart

	var result = resultStart + chunk.label + resultEnd
	return result

func handle_click(meta:String):
	var signalData = GameEvents.parseSignal(meta)
	GameEvents.emit_signal(signalData.signal_name,signalData.id,signalData.arguments)
