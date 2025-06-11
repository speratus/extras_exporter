@tool
extends EditorPlugin

const Exporter = preload("exporter.gd")
var exporter_plugin = Exporter.new()

func _enter_tree() -> void:
	add_export_plugin(exporter_plugin)


func _exit_tree() -> void:
	remove_export_plugin(exporter_plugin)
