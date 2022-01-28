extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var scene = preload("res://Scenes/Enemy.tscn")
export(int) var instancer_id = 0
export(Vector2) var direction = Vector2.ZERO
export(int) var  speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func instance_enemy():
	var node = scene.instance()
	get_tree().root.add_child(node)

	node.direction = direction
	node.speed = speed
	node.position = position

func instance_now(id:int):
	if (id == instancer_id):
		instance_enemy()
