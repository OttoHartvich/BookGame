extends Node2D

func _ready():
	GameEvents.connect("turn_page",self,"shift_up")
	GameEvents.connect("change_page",self,"shift_down")

func shift_up(_v):
	print("going up")
	self.z_index=1
	
func shift_down(_v):
	print("going down")
	self.z_index=-1
