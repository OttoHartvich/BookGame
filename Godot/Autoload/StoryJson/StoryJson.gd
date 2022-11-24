extends Node

var file := File.new()

func load_json(id: String):
	var file_path: String = 'res://Autoload/StoryJson/Pages/' + id + '.json'
	print("this is the file path: ", file_path)
	var error := file.open(file_path ,File.READ)
	if error != OK:
		printerr("Couldn't find or open file %s. Error code: %s" %[file_path,error])
	var content := file.get_as_text()
	print("this is the content: ", content)
	file.close()
	var data: Dictionary = JSON.parse(content).result
	return data
