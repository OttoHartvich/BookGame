extends Resource
class_name TextChunk

@export var id := ''
@export var label := ''
@export var isVisible := true
@export var isClickable := false
@export var tags: Array[String] = []
@export var onClickTargets: Array[String]
