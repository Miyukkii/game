extends Camera2D

@export var player_path: NodePath  # Drag your player node here in the editor

var highest_y = 0.0  # Highest point the camera has reached

func _ready():
	if player_path != null:
		highest_y = get_node(player_path).global_position.y
	else:
		push_warning("Player path is not set!")

func _process(delta):
	if player_path == null:
		return

	var player = get_node(player_path)
	var player_y = player.global_position.y

	# Only move camera upwards if player jumps higher
	if player_y < highest_y:
		highest_y = player_y

	# Set camera position (only y-axis moves up)
	global_position.y = highest_y
