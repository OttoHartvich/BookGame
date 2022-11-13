extends Node
# text effects: https://docs.godotengine.org/en/stable/classes/class_richtexteffect.html#class-richtexteffect
var Json = [
	{
		"name":"Intro", 
		"text":'In this game we will learn how to write a good [wave amp=50 freq=2]story[/wave]',
		"decisions": [
			{
			"target_page":"FirstRoom",
			"label":'To the first Room!',
			"prerequisit": null,
			},
			{
			"target_page":"FirstRoom",
			"label":'To the first Room!',
			"prerequisit": null,
			}
		]
	},
	{
		"name":"FirstRoom", 
		"text":'A good story needs suspense and vanilla, and [wave amp=50 freq=2]burgers[/wave] lots of [wave amp=50 freq=2]BURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERSBURGERS[/wave]',
		"decisions": [
			{
			"target_page":"Intro",
			"label":'To the Intro!',
			"prerequisit": null,
			}
		]
	},
]
