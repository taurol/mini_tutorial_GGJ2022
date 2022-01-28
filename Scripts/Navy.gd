extends KinematicBody2D


var velocity: int = 500


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var direction:Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction.y -=1 
	if Input.is_action_pressed("ui_down"):
		direction.y +=1
	if Input.is_action_pressed("ui_left"):
		direction.x -=1
	if Input.is_action_pressed("ui_right"):
		direction.x +=1
	
	move_and_slide(direction.normalized() * velocity)


func explode():
	queue_free()
