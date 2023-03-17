extends Node
var file_path_save: String = 'user://book.save'

# -----------------
# Loading functions
# -----------------
func read_save_data() -> Dictionary:
	var file = FileAccess.open(file_path_save,FileAccess.READ_WRITE)
	if file.get_error():
		print_debug("Couldn't find or open file %s. Error code: %s" %[file_path_save,file])
	var content: String = file.get_as_text()
	file.close()
	var content_as_json = JSON.new()
	content_as_json = JSON.parse_string(content)
	var data: Dictionary = content_as_json.get_data()
	return data

func load_page_from_library(id: String) -> BookPage:
	var file_path: String = 'res://Autoload/Book/Pages/' + id + '.tres'
	var file = FileAccess.open(file_path,FileAccess.READ_WRITE)
	if file.get_error():
		print_debug("Couldn't find or open file %s. Error code: %s" %[file_path,file])
	var data = file
	file.close()
	return data
	
func load_page_from_saved_data(id: String) -> Dictionary:
	var data = read_save_data()
	return data.id
	
func load_current_page_data() -> Dictionary:
	var data = read_save_data()
	if data.current_page: 
		var pageFromSaveData = BookPage.new()
	return data.intro
	
func load_page(id: String) -> Dictionary:
	var dataFromSaveFile = load_page_from_saved_data(id)
	if dataFromSaveFile: return dataFromSaveFile
	return {}
# -----------------
# Saving functions
# -----------------
func save_book_data(bookPage:BookPage,saveAsCurrentPage = true) -> void:
	var data := read_save_data()
	var bookPageAsDictionary = resource_to_dict(bookPage)
	data[bookPage.id] = bookPageAsDictionary
	data['class_name'] = bookPage.get_class()
	var file = FileAccess.open(file_path_save,FileAccess.WRITE)
	var dataAsString = JSON.stringify(data)
	file.store_string(dataAsString)
	if saveAsCurrentPage:
		bookPage.id = 'current_page'
		save_book_data(bookPage,false)
# -----------------
# Parsing functions
# -----------------
func convert_saved_page_to_resource(data:Dictionary) -> BookPage:
	var bookPage = BookPage.new()
	# here i will have to parse the things individually so they dont get gunked up by all the inherited resources
	return bookPage

func resource_to_dict(resource:Resource) -> Dictionary:
	var result: Dictionary
	var properties = resource.get_script_property_list()
	for i in range(properties.size()):
		var property_name = properties[i]
		var property_value = resource.get(property_name)
		if property_value.is_instance(Resource):
			print("checking for resource type might be buggy delete this if not")
			property_value = resource_to_dict(property_value)
		if typeof(property_value) == TYPE_ARRAY and property_value[0].is_instance(Resource):
			print("checking for array type might be buggy delete this if not")
			property_value = property_value.map(func(value): return resource_to_dict(value))
		result[property_name] = property_value
	result['class_name'] = resource.get_class()
	return result
