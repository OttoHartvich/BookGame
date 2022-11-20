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

# text chunk ID has to match ITEM ID and has to match the URL TAG  ITEM_ID props tag

var Json = [
	{
		"name":"Intro", 
		"text": [
					{
						"id": null,
						"text": "In the beggining I was blue,",
						"states": {
							"default": {
								"tag": "color",
								"props": "=blue",
								"class": null,
							},
						}
					},
					{
						"id": null,
						"text": "but then i turned red with anger ",
						"states": {
							"default": {
								"tag": "color",
								"props": "=red",
								"class": null,
							},
						}
					},
					{
						"id":"item",
						"text": "item", 
						"states": {
							"default": {
								"tag": "url",
								"props": "=item_item",
								"class": "item"
							},
							"inactive":{
								"tag":"color",
								"props": "=grey",
								"class": null,
							}
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
								"class": null,
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
								"class": null,
							},
						}
					},
					{
						"id":"item2",
						"text": "item2", 
						"states": {
							"default": {
								"tag": "url",
								"props": "=item_item2", # 1. ID MUSI BYT UNIKATNI 2. MUSI BYT SPRAVNE FORMAT PROPS
								"class": "item",
							},
							"inactive":{
								"tag":"color",
								"props": "=grey",
								"class": null,
							}
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
