extends Resource
class_name PageButton
# has to be unique and par of trigger
@export var id: String = ""
# is bbc text so can have tags
@export var text: String = ""
# should be false if it should be visible by default
@export var isVisible := true
# id of target page
@export var targetId := ""
