extends Node

var names_by_id = {}

func get(id):
	return names_by_id[id]

func erase(id):
	names_by_id.erase(id)

func set(id, player_name):
	names_by_id[id] = player_name

func clear():
	names_by_id.clear()
