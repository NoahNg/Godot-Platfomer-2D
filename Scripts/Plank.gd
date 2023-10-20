extends KinematicBody2D

const SPEED = 30
const FLOOR = Vector2(0, -1)
const GRAVITY = 10
var velocity = Vector2()
var direction = 1 #right
var screen_size

func _physics_process(_delta):
	velocity.x = SPEED * direction
	velocity = move_and_slide(velocity, FLOOR)
	 
	if is_on_wall():
		direction = direction *-1
