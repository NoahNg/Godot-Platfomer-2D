extends Area2D

const SPEED = 120
var velocity = Vector2()
var direction = 1 #Facing the right

func set_fireball_direction(dir):
	direction = dir
	if dir == -1:
		$AnimatedSprite.flip_h = true
		
func _physics_process(delta):
	velocity.x = SPEED * delta * direction
	translate(velocity)
	$AnimatedSprite.play("Shoot")
	
		
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Fireball_body_entered(body):
	if "Bat" in body.name:

		body.dead()
		

	if "Snail" in body.name:
		
		#queue_free()
		body.damageTaken(10)
		body.showDamage()
		
	if "Player" in body.name:
		pass
	else:
		queue_free()
