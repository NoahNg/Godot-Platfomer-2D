extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const ACCELERATION = 25
var MAX_SPEED = 150
const JUMP_HEIGHT = -370
var motion = Vector2()
var screen_size
const FIREBALL = preload("res://Scenes/Fireball.tscn")
var is_attacking = false

func _ready():
	screen_size = get_viewport_rect().size

	
func _physics_process(delta):
	#if WelcomeDialog.has_been_played == false:
		#MAX_SPEED = 0
	#if WelcomeDialog.has_been_played == true: 
		#MAX_SPEED = 150
	#print(MAX_SPEED)
	motion.y += GRAVITY
	var friction = false
	
	#move to the right
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)#if motion is bigger than max speed, then set it to max speed
		$Sprite.flip_h = false
		if is_on_floor():
			$Sprite.play("Run")
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
			

	#move to the left
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		if is_on_floor():
			$Sprite.play("Run")
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	
	#not pressing anything 
	else:
		motion.x = lerp(motion.x, 0, 0.3)
		friction = true
		$Sprite.play("Idle")
	
	#set ceiling direction
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.3)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	
	#Code for fireball
	if Input.is_action_just_pressed("ui_focus_next") && is_attacking == false:
		is_attacking = true
		$FireballTimer.start()
		$Sprite.play("Fire")
		var fireball = FIREBALL.instance()
		#set left or right (depends on the player) before adding the fireball into the scene
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)	
		$ShootFireball.play()
		get_parent().add_child(fireball)
		fireball.position = $Position2D.global_position
	if get_tree().get_current_scene().get_name() == "World1":	
		if get_parent().get_node(".").gonextworld == false:
			motion = move_and_slide(motion, UP)
		else:
			motion = Vector2()
	else: 
		motion = move_and_slide(motion, UP)
	
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)  
	if get_node("/root/MainHud").lives == 0:
		$".".hide()
	if get_slide_count() > 0:
		for i in range(get_slide_count()):
			if "Bat" in get_slide_collision(i).collider.name:	
				if $InvulnerabilityTimer.is_stopped():
					$GotHit.play()
					$InvulnerabilityTimer.start()
					$InvulnerabilityAnimation.play("Inv")
					$".".global_position = global_position + Vector2(-20,0)
					get_parent().get_node("Bat/CollisionShape2D").disabled = true
					$DamageAnimation.play("Damage")
					get_node("/root/MainHud").lives -= 1

				get_parent().get_node("Bat/CollisionShape2D").disabled = false
				#print(get_slide_collision(i).collider.name)
				#print(str(get_node("/root/MainHud").lives))	
				#$InvulnerabilityAnimation.stop()
			if "Snail" in get_slide_collision(i).collider.name:
				if $InvulnerabilityTimer.is_stopped():
					$InvulnerabilityTimer.start()
					$GotHit.play()
					$InvulnerabilityAnimation.play("Inv")
					$".".global_position = global_position + Vector2(-20,0)
					get_parent().get_node("Snail/CollisionShape2D").disabled = true
					$DamageAnimation.play("Damage")
					get_node("/root/MainHud").lives -= 1

				get_parent().get_node("Snail/CollisionShape2D").disabled = false
#func _on_Sprite_animation_finished():
	#is_attacking = false

func playRun():
	$Sprite.play("Run")

func _on_InvulnerabilityTimer_timeout():
	$InvulnerabilityAnimation.play("Rest")


func _on_FireballTimer_timeout():
	is_attacking = false
