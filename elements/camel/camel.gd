extends Alive

var can_melee_attack: bool = true
var melee_damage: int = 10

signal player_death
	
func init():
	max_health = 100.0
	health = 20.0

func _ready():
	init()
	pass

func _physics_process(delta: float):
	
	Globals.player_position = global_position
	
	if not is_on_floor():
		velocity.y += gravity * delta 	# affecting character by gravity
	
	if is_alive:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = jump_velocity	# lifting up a character by the amount of px in JUMP_VELOCITY
			
		var direction = Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
	else:
		velocity.x = 0
	move_and_slide()
	
func _process(_delta):
	if is_alive:
		if Input.is_action_just_pressed("attack") and can_melee_attack:
			$AnimationPlayer.play("attack")
			$AttackArea/CollisionPolygon2D.disabled = false
			is_attacking = true
			can_melee_attack = false
			$MeleeAttackTimer.start()
			await $AnimationPlayer.animation_finished
			$AttackArea/CollisionPolygon2D.disabled = true
			is_attacking = false
		if not is_attacking:
			$AnimationPlayer.play("run")


func _on_attack_area_body_entered(body):
	if "take_damage" in body:
		body.take_damage(melee_damage)

func _on_melee_attack_timer_timeout():
	can_melee_attack = true

func death():
	is_alive = false
	$AnimationPlayer.play("death")
	player_death.emit()
	await $AnimationPlayer.animation_finished
	$CollisionShape2D.set_deferred("disabled", true)
