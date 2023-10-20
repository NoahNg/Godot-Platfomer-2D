extends Area2D

var has_been_shown = false

func _physics_process(delta):
	$Icon.play("Idle")
	#print(get_node(".").position)
	if get_tree().get_current_scene().get_name() == "World2":
		if get_parent().get_node("Snail").is_dead == true && has_been_shown == false:
			get_node(".").position = get_parent().get_node("Snail").global_position
			get_node(".").visible = true
			has_been_shown = true

func _on_ButterChicken_body_entered(body):
	if body.name == "Player":
		get_parent().get_node("PickedUp").play()
		get_parent().get_node("MainHUD").score += 1
		queue_free()
	pass # Replace with function body.
