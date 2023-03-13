extends Node

var file

func load_json(id: String):
	var file_path: String = 'res://Autoload/StoryJson/Pages/' + id + '.json'
	file = FileAccess.open(file_path,FileAccess.READ_WRITE)
	if file.get_error():
		print_debug("Couldn't find or open file %s. Error code: %s" %[file_path,file])
	var content: String = file.get_as_text()
	file.close()
	var test_json_conv = JSON.new()
	test_json_conv.parse(content)
	var data: Dictionary = test_json_conv.get_data()
	return data
