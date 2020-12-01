extends Node

var names_by_id = {}

func list_ids():
	return names_by_id

func has(id):
	return names_by_id.has(id)

func get(id):
	return names_by_id[id]

func erase(id):
	names_by_id.erase(id)

func set(id, player_name):
	names_by_id[id] = player_name

func clear():
	names_by_id.clear()

func _ready():
	pass # Replace with function body.

