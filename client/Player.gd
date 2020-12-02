extends KinematicBody2D

const SPEED = 300
var velocity = Vector2()

puppet var puppet_position
puppet var puppet_velocity = Vector2()

func _ready():
	if is_network_master():
		$NameLabel.text = "You"
	else:
		var player_id = get_network_master()
		$NameLabel.text = PlayerNames.get(player_id)
		puppet_position = position


func _physics_process(delta):
	if is_network_master():
		var move_dir = Vector2()
		
		if Input.is_action_pressed("ui_up"):
			move_dir.y -= 1
		if Input.is_action_pressed("ui_down"):
			move_dir.y += 1
		if Input.is_action_pressed("ui_left"):
			move_dir.x -= 1
		if Input.is_action_pressed("ui_right"):
			move_dir.x += 1
		
		velocity = move_dir.normalized() * SPEED
		
		rset_unreliable("puppet_position", position)
		rset_unreliable("puppet_velocity", velocity)
	else:
		# If we are not the ones controlling this player, 
		# sync to last known position and velocity
		position = puppet_position
		velocity = puppet_velocity
	
	move_and_slide(velocity, Vector2(0,0))
	
	if not is_network_master():
		# It may happen that many frames pass before the controlling player sends
		# their position again. If we don't update puppet_pos to position after moving,
		# we will keep jumping back until controlling player sends next position update.
		# Therefore, we update puppet_pos to minimize jitter problems
		puppet_position = position
	
