extends Node
# text effects: https://docs.godotengine.org/en/stable/classes/class_richtexteffect.html#class-richtexteffect

# [
#	{
#		"id":"..." unique but only really relevant for items
#		"text": "string", 
#		"states": {
#			"active": {
#				"tag": string - musi by tag jako: https://docs.godotengine.org/en/stable/tutorials/ui/bbcode_in_richtextlabel.html
#				"props": string - vypsany string efektu co mamit text viz ^^^ 
#			},
#			"inactive": {
#				...
#			},
#			...
#		}
#	},
#	...
#]
var Json = [
	{
		"name":"Intro", 
		"text": [
					{
						"id":null,
						"text": "In the beggining I was blue,", 
						"states": {
							"default": {
								"tag": "color",
								"props": "=blue",
							},
						}
					},
					{
						"id":null,
						"text": "but then i turned red with anger", 
						"states": {
							"default": {
								"tag": "color",
								"props": "=red",
							},
						}
					},
				],
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
		"text": [
					{
						"id":null,
						"text": "I started feeling strange effects,", 
						"states": {
							"default": {
								"tag": "tornado",
								"props": " radius=5 freq=2",
							},
						}
					},
					{
						"id":null,
						"text": "shaking like crazy", 
						"states": {
							"default": {
								"tag": "shake",
								"props": " rate=5 level=10",
							},
						}
					},
				],
		"decisions": [
			{
			"target_page":"Intro",
			"label":'To the Intro!',
			"prerequisit": null,
			}
		]
	},
]
