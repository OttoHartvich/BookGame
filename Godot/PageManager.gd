extends Node

var level = {
	"intro": {
		"thing": "hello"
	}
}

func _ready() -> void:
	GameEvents.connect("change_page", self, "_handle_change_page")
	print("Json Test ", level.intro.thing)


func _handle_chage_page(page_name) -> void:
	print('Turning page to: ', page_name)
	
