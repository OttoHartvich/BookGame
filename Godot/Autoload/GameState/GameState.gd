extends Node

var current_page
var next_page
var player = {
	"items":[
	],
	"health":3
}
var turning_page = false

func _ready():
	if current_page == null:
		change_page("Intro")
	GameEvents.connect("change_page", self,"change_page")

func change_page(new_page):
	for n in StoryJson.Json:
		if n.name == new_page:
			current_page = n



