extends Node

var Json = [
	{
		"name":"Intro", 
		"text":'In this game we will learn how to write a good story',
		"decisions": [
			{
			"target_page":"FirstRoom",
			"label":'To the first Room!',
			"prerequisit": null,
			}
		]
	},
	{
		"name":"FirstRoom", 
		"text":'A good story needs suspense and vanilla',
		"decisions": [
			{
			"target_page":"Intro",
			"label":'To the Intro!',
			"prerequisit": null,
			}
		]
	},
]
