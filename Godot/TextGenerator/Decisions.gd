extends GridContainer

@export(NodePath) onready var text_render = get_node(text_render) as RichTextLabel
func _init():
	if self.get_child_count() == 0:
		recreate_buttons("")

func _ready():
	GameEvents.connect("turn_page",Callable(self,"disable_buttons"))
	GameEvents.connect("change_page",Callable(self,"recreate_buttons"))

func _process(_delta):
	if text_render.percent_visible == 1 and self.modulate.a == 0: 
		self.modulate.a = 1
		enable_buttons("")
	if text_render.percent_visible != 1 and self.modulate.a == 1:
		self.modulate.a = 0

func delete_buttons(_page):
	for n in self.get_children():
		self.remove_child(n)
		n.queue_free()
		
func disable_buttons(_page):
	for n in self.get_children():
		n.disabled = true

func enable_buttons(_page):
	for n in self.get_children():
		n.disabled = false

func recreate_buttons(_page) -> void:
	#look for new page info
	delete_buttons("")
	for n in GameState.current_page.decisions:
		var button = load("res://Resources/GenericButton.tscn").instantiate()
		button.text = n.label
		button.target_page = n.target_page
		self.add_child(button)
	disable_buttons("")

