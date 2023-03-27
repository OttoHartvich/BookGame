extends Resource
class_name BookPage

@export var id := ''
@export var text: String = ""
@export var buttons: Array[PageButton] = []
@export var onLoadEventTargets: Array[String]
