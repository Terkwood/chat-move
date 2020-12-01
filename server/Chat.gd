extends Panel

onready var ChatDisplay = $Display
onready var ChatInput = $Input

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ENTER:
			send_message()

func send_message():
	var msg = ChatInput.text
	ChatInput.text = ""
	var id = get_tree().get_network_unique_id()
	rpc("receive_message", id, msg)

sync func receive_message(id, msg):
	ChatDisplay.text += "\n" + PlayerNames.get(id) + ": " + msg
	ChatDisplay.set_v_scroll(100.0)
