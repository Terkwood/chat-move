extends Control

onready var status = get_node("VBox/Status")

func _ready():
	net.connect("connection_failed", self, "_on_connection_failed")
	net.connect("connection_succeeded", self, "_on_connection_success")
	net.connect("server_disconnected", self, "_on_server_disconnect")

	$VBox/JoinButton.disabled = true
	
	status.text = "Connecting..."
	status.modulate = Color.yellow


func _on_JoinButton_pressed():
	net.my_name = $VBox/HBox/LineEdit.text
	net.pre_start_game()


func _on_connection_success():
	$VBox/JoinButton.disabled = false
	
	status.text = "Connected!"
	status.modulate = Color.green
	

func _on_connection_failed():
	$VBox/JoinButton.disabled = true
	
	status.text = "Connection failed. Trying again..."
	status.modulate = Color.red
	
func _on_server_disconnect():
	$VBox/JoinButton.disabled = true
	status.text = "Server disconnected. Trying to reconnect..."
