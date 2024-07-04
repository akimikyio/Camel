extends Enemy

#var need_attack: bool = false
signal plant_bullet(pos, direction)

func _ready():
	max_health = 20
	health = 20
	$AnimationPlayer.play("idle")
	
	
	

func _process(_delta):
	if $AttackArea.is_colliding():
		#need_attack = true
		$AnimationPlayer.play("attack")
	else:
		$AnimationPlayer.play("idle")
	#if need_attack:
	#	$AnimationPlayer.play("attack")
		

#func _on_attack_area_body_entered(_body):
#	need_attack = true

#func _on_attack_area_body_exited(_body):
	#need_attack = false
	#$AnimationPlayer.play("idle")

func attack():
	plant_bullet.emit($SpawnBullets.global_position, Vector2.LEFT.rotated(rotation))
