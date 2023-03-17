extends Resource
class_name BookPage

@export var text: Array[TextChunk] = []
@export var buttons: Array[PageButton] = []
@export var id := ''
@export var onLoadEventTargets: Array[EventTarget]
