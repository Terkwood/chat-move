extends Node

const DEFAULT_PORT = 34543
const MAX_PLAYERS = 12

onready var Chat = load("res://Chat.tscn")

func _ready():
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self,"_player_disconnected")
	
	create_server()
	create_chat()

func create_server():
	var host = NetworkedMultiplayerENet.new()
	host.create_server(DEFAULT_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(host)
 
func create_chat():
	get_tree().get_root().call_deferred("add_child", Chat.instance())

# Callback from SceneTree, called when client connects
func _player_connected(_id):
	print("Client ", _id, " connected")


# Callback from SceneTree, called when client disconnects
func _player_disconnected(id):
	if PlayerNames.has(id):
		rpc("unregister_player", id)
		get_node("/root/World").rpc("remove_player", id)
	
	print("Client ", id, " disconnected")

# Player management functions
remote func register_player(new_player_name):
	var caller_id = get_tree().get_rpc_sender_id()
	
	PlayerNames.set(caller_id, new_player_name)
	
	# send each player to new player
	for pid in PlayerNames.list_ids():
		rpc_id(caller_id, "register_player", pid, PlayerNames.get(pid))
	
	# send new player to each player
	rpc("register_player", caller_id, PlayerNames.get(caller_id))
	# NOTE: this means new player's register gets called twice,
	#       but fine as same info sent both times
	
	print("Client ", caller_id, " registered as ", new_player_name)

puppetsync func unregister_player(id):
	PlayerNames.erase(id)
	print("Client ", id, " was unregistered")

remote func populate_world():
	var caller_id = get_tree().get_rpc_sender_id()
	var world = get_node("/root/World")
	
	# Spawn all current players on new client
	for player in world.get_node("Players").get_children():
		world.rpc_id(caller_id, "spawn_player", player.position, player.get_network_master())
	
	# Spawn new player everywhere
	world.rpc("spawn_player", random_vector2(500, 500), caller_id)


# Return random 2D vector inside bounds 0, 0, bound_x, bound_y
func random_vector2(bound_x, bound_y):
	return Vector2(randf() * bound_x, randf() * bound_y)

