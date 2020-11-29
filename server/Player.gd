extends KinematicBody2D

const SPEED = 300
var velocity = Vector2()

puppet var puppet_position
puppet var puppet_velocity = Vector2()

func _ready():
	var player_id = get_network_master()
	$NameLabel.text = net.player_names_by_id[player_id]
	puppet_position = position
	
func _process(delta):
	position = puppet_position
	velocity = puppet_velocity
	position += velocity * delta
	
	# minimize jitter in case many frames
	# have passed since master sent data
	puppet_position = position
