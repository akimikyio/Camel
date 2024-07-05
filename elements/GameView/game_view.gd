extends Node2D

var speed: float = 100.0
var is_playing: bool = true


func _ready():
	speed = Globals.level_speed
	var size = get_viewport_rect().size
	$LeftBorder.position.x = -size.x / 2;
	$RightBorder.position.x = size.x / 2;
	
func _process(delta):
	if is_playing:
		move_local_x(delta * speed)


func _on_camel_player_death():
	is_playing = false
