extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var direction = Vector2.ZERO
var  speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	move_and_slide(direction * speed)


func _on_Area2D_body_entered(body):
	if (body.is_in_group("Navy")):
		body.explode()
		queue_free()

