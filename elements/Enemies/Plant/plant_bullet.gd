extends Area2D


const damage: int = 5
const speed: float = 100.0
var direction: Vector2 = Vector2.LEFT
var is_alive: bool = true
var bullet_pieces: Texture2D = preload("res://assets/sprites/enemies/plant/Bullet Pieces.png")

func _process(delta):
	if is_alive:
		position += speed * direction * delta

func _on_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if is_alive and "hit" in body:
		body.hit(damage)
	death()

func _on_death_timer_timeout():
	queue_free()

func _on_area_entered(_area):
	death()

func death():
	$Sprite2D.texture = bullet_pieces
	is_alive = false
	$AudioStreamPlayer2D.play()
	$DeathTimer.start()
