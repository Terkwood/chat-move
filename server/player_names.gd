extends Node

const SERVER_ID = 1
const SERVER_NAME = "SERVER"
const DEFAULT_DATA = { SERVER_ID: SERVER_NAME }

var names_by_id = DEFAULT_DATA

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
	names_by_id = DEFAULT_DATA
