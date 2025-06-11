@tool
extends EditorExportPlugin


func _export_begin(features: PackedStringArray, is_debug: bool, path: String, flags: int) -> void:
	var dir_name = path.get_base_dir()
	
	var dir = DirAccess.open(".")
	if dir and !dir.dir_exists(dir_name):
		dir.make_dir_recursive(dir_name)
		
	#dir = DirAccess.open("res://")
	
	var extra_files = get_option("extras_exporter/additional_files")
	for file_path in extra_files:
		var file_name = file_path.get_file()
		dir.copy(file_path, dir_name + '/' + file_name)
		
	if get_option("extras_exporter/write_version_file"):
		var file_name = "version.txt"
		var version = ProjectSettings.get_setting("application/config/version")
		var vf = FileAccess.open(dir_name + "/" + file_name, FileAccess.WRITE)
		vf.store_line(version)
	
	
func _export_end() -> void:
	pass
	
	
func _get_export_options(_platform: EditorExportPlatform) -> Array[Dictionary]:
	return [
		{
			"option": {
				"name": "extras_exporter/additional_files",
				"class_name": "",
				"type": TYPE_ARRAY,
				"hint": PROPERTY_HINT_TYPE_STRING,
				"hint_string": "%d/%d:*" % [TYPE_STRING, PROPERTY_HINT_FILE],
				"usage": PROPERTY_USAGE_EDITOR,
			},
			"default_value": [],
			"update_visibility": false,
		},
		{
			"option": {
				"name": "extras_exporter/write_version_file",
				"class_name": "",
				"type": TYPE_BOOL,
				"usage": PROPERTY_USAGE_EDITOR,
			},
			"default_value": true,
			"update_visibility": false,
		}
	]
