extends KinematicBody2D

const GRAVITY = 20
var motion = Vector2()
var is_dead = false
const UP = Vector2(0, -1)
var has_been_played = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.play("Fly")
	if is_dead == true:
		dead()
		#motion.y += GRAVITY
		#$Sprite.playing = false
		#$CollisionShape2D.disabled = true

		
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Player" in get_slide_collision(i).collider.name:
				#dead()
				#get_node("/root/MainHud").lives -= 1
				#queue_free()
				$CollisionShape2D.disabled = true
				$CollisionTimer.start()
				#print(str(get_node("/root/MainHud").lives))	
				
	motion = move_and_slide(motion, UP)
func dead():
	is_dead = true
	$AnimationPlayer.stop()
	motion.y += GRAVITY
	$CollisionShape2D.disabled = true
	$Timer.start()
	if has_been_played == false:
		$FireBallHit.play()
		has_been_played = true
	#queue_free()
	




func _on_Timer_timeout():
	queue_free()
	has_been_played = false


func _on_CollisionTimer_timeout():
	$CollisionShape2D.disabled = false
