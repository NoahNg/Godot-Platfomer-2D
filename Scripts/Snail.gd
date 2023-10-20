extends KinematicBody2D

var health = 100
const SPEED = 30
const FLOOR = Vector2(0, -1)
const GRAVITY = 10
var velocity = Vector2()
var direction = 1 #right
var screen_size
var is_hiding = false
var timer = false
var is_dead = false
var has_been_played = false
var snail_position = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	
func _physics_process(delta):
	if health <= 100 && health > 60:
		$AnimatedSprite.play("Walk")
	if health == 60 && has_been_played == false:
		is_hiding = true
		print("is hiding")
		#$HideTimer.start()
		$AnimatedSprite.play("Hide")
		$Walk.stop(false)
	#if health == 10:
		#$AnimatedSprite.play("Show")
	if health == 0:
		$AnimatedSprite.play("Dead")
		$Walk.stop(false)
		is_dead = true
	

func damageTaken(num):
	$FireBallHit.play()
	if !is_hiding:
		health -= num

func showDamage():
	$DPSTimer.start()
	$DPS.show()
	if is_hiding == true:
		$DPS.text = "0"
		if timer == false:
			$HideTimer.start()
			timer = true

	else:
		$DPS.text = "10"
		#$DPSTimer.start()
		#$DPS.show()
		if health == 90:
			$"HealthBar2/100-90".play("100-90")
		if health == 80:
			$"HealthBar2/90-80".play("90-80")
		if health == 70:
			$"HealthBar2/80-70".play("80-70")
		if health == 60:
			$"HealthBar2/70-60".play("70-60")
		if health == 50:
			$"HealthBar2/60-50".play("60-50")
		if health == 40:
			$"HealthBar2/50-40".play("50-40")
		if health == 30:
			$"HealthBar2/40-30".play("40-30")
		if health == 20:
			$"HealthBar2/30-20".play("30-20")
		if health == 10:
			$"HealthBar2/20-10".play("20-10")
		if health == 0:
			snail_position = $".".global_position
			$"HealthBar2/10-0".play("10-0")
			$CollisionShape2D.disabled = true
			$Timer.start()
func _on_Timer_timeout():
	$CollisionShape2D.disabled = true
	$AnimatedSprite.hide()
	$HealthBar.hide()
	$BasewhiteHealthBar.hide()
	$HealthBar2.hide()


func _on_DPSTimer_timeout():
	$DPS.hide()


func _on_HideTimer_timeout():
	print("timeout")
	is_hiding = false
	has_been_played = true
	$AnimatedSprite.play("Show")
	$AnimatedSprite.play("Walk")
	$Walk.play("Left&Right")
