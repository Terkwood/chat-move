extends Node

const ip = "127.0.0.1"
const DEFAULT_PORT = 34543

# for GUI
signal connection_failed()
signal connection_succeeded()
signal server_disconnected()

var my_name = "Someone"


func _ready():
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")

	connect_to_server()

func connect_to_server():
	var host = NetworkedMultiplayerENet.new()
	host.create_client(ip, DEFAULT_PORT)
	get_tree().set_network_peer(host)

# Callback from SceneTree
func _connected_ok():
	emit_signal("connection_succeeded")

# Callback from SceneTree
func _server_disconnected():
	PlayerNames.clear()
	get_node("/root/World").queue_free()
	get_node("/root/Connect").show()
	emit_signal("server_disconnected")
	
	# Try to connect again
	connect_to_server()

# Callback from SceneTree
func _connected_fail():
	get_tree().set_network_peer(null) # Remove peer
	emit_signal("connection_failed")
	
	# Try to connect again
	connect_to_server()

puppet func register_player(id, new_player_data):
	PlayerNames.set(id, new_player_data)


puppet func unregister_player(id):
	PlayerNames.erase(id)


puppet func pre_start_game():
	# Register ourselves with the server
	rpc_id(1, "register_player", my_name)
	
	# Load world
	get_node("/root/Connect").hide()
	var world = load("res://World.tscn").instance()
	var chat = load("res://Chat.tscn").instance()
	get_tree().get_root().add_child(world)
	get_tree().get_root().add_child(chat)
	
	# call to server
	rpc_id(1, "populate_world")
