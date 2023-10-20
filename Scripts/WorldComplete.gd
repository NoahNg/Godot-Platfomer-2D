extends Area2D

var can_interact = false
var dialog_index = 0
var has_been_played = false
var failDialog = [
	'I see that you have not collected all 3 pies...','1',
	'Come back once you have collected all of them.', '1'
]
#var nextworldscene = false
var successDialog = [
	'Well done!...', '1',
	'Let\'s go to the next level.', '1'
]

var completeDialog = [
	'You did it! Good job!','1'
]
export(String, FILE, "*.tscn") var next_world

func _on_WorldComplete_body_entered(body):
	if body.name == "Player":
		$Label.visible = true
		can_interact = true
		
func _on_WorldComplete_body_exited(body):
	if body.name == "Player":
		$Label.visible = false
		can_interact = false

func _process(delta):
	#print(get_parent().get_node(".").gonextworld)
	#get_tree().get_root().set_disable_input(true)
	if Input.is_action_just_pressed("ui_accept") && can_interact == true:
		$Label.visible = false
		if get_parent().get_node("MainHUD").score < 3:
			play_dialog(failDialog)
			has_been_played = false
		elif get_tree().get_current_scene().get_name() == "World1":
			play_dialog(successDialog)
			if has_been_played == true:
				next_world_scene()
				yield(get_tree().create_timer(3.0), "timeout")
				get_tree().change_scene(next_world)
				has_been_played = false
		elif get_tree().get_current_scene().get_name() == "World2":
			play_dialog(completeDialog)
			if has_been_played == true:
				$LevelUp.play()
				get_tree().change_scene(next_world)
				has_been_played = false
			
func play_dialog(dialog):
	get_node("/root/Dialog").load_dialog(dialog, dialog_index)
	dialog_index += 2
	if (dialog_index > dialog.size()):
		dialog_index = 0
		can_interact = false
		has_been_played = true

func next_world_scene():
	get_parent().get_node("Bebi").play("Walk")
	get_parent().get_node("Bebi/AnimationPlayer").play("WalkOff")
	get_parent().get_node("Player").playRun()
	get_parent().get_node("Player/AnimationPlayer").play("WalkOff")
	get_parent().get_node("BorderDialog2/CollisionShape2D").disabled = true
	get_parent().get_node("Player/ColorRect").visible = true
	get_parent().get_node("Player/ColorRect/AnimationPlayer").play("ComeIn")
	get_parent().get_node("Player/ColorRect2").visible = true
	get_parent().get_node("Player/ColorRect2/AnimationPlayer").play("ComeIn")
	#get_tree().get_root().set_disable_input(true)
	get_parent().get_node(".").gonextworld = true
	$LevelUp.play()
