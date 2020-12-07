extends Panel

signal chat_focus_grabbed
signal chat_focus_released

onready var ChatDisplay = $Display
onready var ChatInput = $Input

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ENTER:
			if ChatInput.has_focus():
				if ChatInput.text.strip_edges() != "":
					_send_message()					
				_release_focus()
			else:
				ChatInput.grab_focus()
				emit_signal("chat_focus_grabbed")
		
		if event.pressed and event.scancode == KEY_ESCAPE and ChatInput.has_focus():
			ChatInput.release_focus()
			emit_signal("chat_focus_released")

func _send_message():
	var msg = ChatInput.text
	ChatInput.text = ""
	var id = get_tree().get_network_unique_id()
	rpc("receive_message", id, msg)

sync func receive_message(id, msg):
	ChatDisplay.text += "\n" + PlayerNames.get(id) + ": " + msg
	ChatDisplay.set_v_scroll(100.0)

func _release_focus():
	ChatInput.release_focus()
	emit_signal("chat_focus_released")
