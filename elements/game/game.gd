extends Node2D

var plant_bullet_scene: PackedScene = preload("res://elements/Enemies/Plant/plant_bullet.tscn")

func _ready():
	for plant in get_tree().get_nodes_in_group("Plants"):
		plant.connect("create_plant_bullet", create_plant_bullet)

func create_plant_bullet(pos, direction):
	var bullet = plant_bullet_scene.instantiate()
	bullet.position = pos
	bullet.direction = direction
	$Projectiles.add_child(bullet)
