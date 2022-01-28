extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var navy = preload("res://Scenes/Navy.tscn")

var can_summon: bool = true

var life:int = 10
# Called when the node enters the scene tree for the first time.
signal recieved_damage
signal died

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if life == 0:
		$Timer.stop()
		can_summon = false
		emit_signal("died")
		

	if can_summon:
		if Input.is_action_just_pressed("navy summon"):
			var node = navy.instance()
			get_tree().root.add_child(node)
			node.position = position
			can_summon = false


func _on_Timer_timeout():
	can_summon = true


func _on_Area2D_body_entered(body):
	if (body.is_in_group("Enemies")):
		take_damage()
		body.queue_free()

func take_damage():
	life -= 1
	emit_signal("recieved_damage", life)

