extends Node


var current_page_name = "Intro"




func _on_ready():
	GameEvents.connect("change_page", self,"change_page")

func change_page(new_page):
	current_page_name = new_page
