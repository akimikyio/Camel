extends Node2D

var plant_bullet_scene: PackedScene = preload("res://elements/Enemies/Plant/plant_bullet.tscn")

func _ready():
	for plant in get_tree().get_nodes_in_group("Plants"):
		plant.connect("plant_bullet", plant_bullet_create)
	for enemy in get_tree().get_nodes_in_group("Enemies"):
		enemy.get_node("HealthBar").max_value = enemy.max_health

func plant_bullet_create(pos, direction):
	var bullet = plant_bullet_scene.instantiate() as Area2D
	bullet.position = pos
	bullet.direction = direction
	$Projectiles.add_child(bullet)
