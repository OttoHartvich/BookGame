extends Node2D

func _ready():
	GameEvents.connect("turn_page",Callable(self,"shift_up"))
	GameEvents.connect("change_page",Callable(self,"shift_down"))

func shift_up(_v):
	self.z_index=2

func shift_down(_v):
	self.z_index=1
