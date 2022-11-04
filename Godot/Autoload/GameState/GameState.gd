extends Node

var current_page

func _ready():
	if current_page == null:
		change_page("Intro")
	GameEvents.connect("change_page", self,"change_page")

func change_page(new_page):
	for n in StoryJson.Json:
		if n.name == new_page:
			current_page = n
	print(current_page.name)


