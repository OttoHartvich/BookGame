extends Resource
class_name BookPage

@export var text: Array[TextChunk] = []
@export var buttons: Array[PageButton] = []
@export var id := self.resource_name
