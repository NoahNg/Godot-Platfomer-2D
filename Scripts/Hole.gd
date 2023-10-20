extends Area2D

var dialog_index = 0
var deadDialog = [
	'...', '1',
	'Better luck next time...', '1']
#var current_scene_name = get_tree().get_current_scene().get_name()
var can_interact = false
var has_been_played = false

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") && can_interact == true:
		play_dead_dialog()

func play_dead_dialog():
	get_node("/root/Dialog").load_dialog(deadDialog, dialog_index)
	dialog_index += 2
	if (dialog_index > deadDialog.size()):
		dialog_index = 0
		can_interact = false
		get_tree().change_scene("res://Scenes/GameOver.tscn")
			
		
func _on_Hole_body_entered(body):
	if body.name == "Player":
		can_interact = true
		play_dead_dialog()
		
		
