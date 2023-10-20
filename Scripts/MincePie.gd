extends Area2D

func _physics_process(delta):
	$Icon.play("Idle")

func _on_MincePie_body_entered(body):
	if body.name == "Player":
		get_parent().get_node("PickedUp").play()
		get_parent().get_node("MainHUD").score += 1
		queue_free()
	pass # Replace with function body.
