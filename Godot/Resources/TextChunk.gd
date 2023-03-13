extends Resource
class_name TextChunk

@export var id := ''
@export var text := ''
@export var isVisible := true
@export var isClickable := false
@export var tags: Array[String] = []
@export var targetType: Enums.ButtonType
@export var targetId: String =  ''
