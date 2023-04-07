extends MarginContainer
# has to be the same as array in GameEvents
@export_enum("Inventory", "Chart", "Notes") var button_type: int
@export_node_path("Button") var button_path
@onready var button := get_node(button_path) as Button
# Called when the node enters the scene tree for the first time.

func _ready():
	button.text = GameEvents.inventory_modals[button_type]

func _on_button_pressed():
	GameEvents.emit_signal('switchInventoryPanel',button_type) # Replace with function body.
