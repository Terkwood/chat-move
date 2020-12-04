extends Panel

onready var ChatDisplay = $Display
onready var ChatInput = $Input

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ENTER:
			if ChatInput.has_focus():
				if ChatInput.text.strip_edges() == "":
					ChatInput.release_focus()
				else:
					send_message()
			else:
				ChatInput.grab_focus()
		
		if event.pressed and event.scancode == KEY_ESCAPE and ChatInput.has_focus():
			ChatInput.release_focus()

func send_message():
	var msg = ChatInput.text
	ChatInput.text = ""
	var id = get_tree().get_network_unique_id()
	rpc("receive_message", id, msg)

sync func receive_message(id, msg):
	ChatDisplay.text += "\n" + PlayerNames.get(id) + ": " + msg
	ChatDisplay.set_v_scroll(100.0)
