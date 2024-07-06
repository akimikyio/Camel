extends RangedEnemy

signal create_plant_bullet(pos, direction)

func init():
	max_health = 20
	health = 20

func _ready():
	init()

func _process(_delta):
	if not is_disabled:
		if $AttackArea.is_colliding():
			$AnimationPlayer.play("attack")
		else:
			$AnimationPlayer.play("idle")

func attack():
	create_plant_bullet.emit($SpawnBullets.global_position, Vector2.LEFT.rotated(rotation))
