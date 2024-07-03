extends Node2D

const SPEED = 100

func _ready():
	var size = get_viewport_rect().size
	$LeftBorder.position.x = -size.x / 2;
	$RightBorder.position.x = size.x / 2;
	
func _process(delta):
	move_local_x(delta * SPEED)
