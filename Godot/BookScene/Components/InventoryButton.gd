extends MarginContainer
@export_enum("Inventory", "Chart", "Notes") var button_type: int
@export_node_path("Button") var button_path
@onready var button := get_node(button_path) as Button
# Called when the node enters the scene tree for the first time.
var button_type_labels = ["Inventory", "Chart", "Notes"]
func _ready():
	button.text = button_type_labels[button_type]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
