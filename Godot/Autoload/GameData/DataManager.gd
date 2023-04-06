extends Node
var file_path_save: String = 'user://book.save'

# -----------------
# Loading functions
# -----------------
func load_save_data() -> Dictionary:
	var file = FileAccess.open(file_path_save,FileAccess.WRITE_READ)
	if file.get_error():
		print_debug("Couldn't find or open file %s. Error code: %s" %[file_path_save,file])
	var content: String = file.get_as_text()
	if content == '': return {}
	file.close()
	var content_as_json = JSON.new()
	content_as_json = JSON.parse_string(content)
	var data: Dictionary = content_as_json.get_data()
	return data

func load_page_from_library(id: String) -> BookPage:
	var file_path: String = 'res://Autoload/GameData/Pages/' + id + '.tres'
	var file: Resource = null
	if ResourceLoader.exists(file_path):
		file = ResourceLoader.load(file_path)
	return file

func load_current_page_data() -> BookPage:
	var data = load_save_data()
	if data.current_page_id:
		return load_page_from_library(data.current_page_id)
	return load_page_from_library('Introduction')

# -----------------
# Saving functions
# -----------------
func save_data_to_file(data:Dictionary,path := file_path_save) -> void:
	var file = FileAccess.open(path,FileAccess.WRITE_READ)
	var data_as_string = JSON.stringify(data)
	file.store_string(data_as_string)
	file.close()

func save_game(gameState: Dictionary) -> void:
	save_data_to_file(gameState)
