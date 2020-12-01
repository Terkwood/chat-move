extends Node

var names_by_id = {}


#TODO unused
# Returns list of player names
#func get_all():
#	return names_by_id.values()

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

