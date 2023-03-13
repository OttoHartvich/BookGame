extends Node3D

@onready var animation_player = $AnimationPlayer

func _ready():
	animation_player.seek(1.25, true) 

func _process(_delta):
	animation_player.seek(1.25, true) 
