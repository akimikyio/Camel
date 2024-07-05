extends Enemy

#var need_attack: bool = false
signal create_plant_bullet(pos, direction)

func _process(_delta):
	if not is_disabled:
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
	create_plant_bullet.emit($SpawnBullets.global_position, Vector2.LEFT.rotated(rotation))
