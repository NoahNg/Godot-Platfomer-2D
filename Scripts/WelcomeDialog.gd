extends Area2D

var dialog_index = 0
var welcomeDialog1 = [
	'Welcome to the first level...', '1',
	'You will need to collect all three pies to proceed to the next level...', '1',
	'Remember to watch out for the bats or kill them with your fireballs...', '1']
var welcomeDialog2 = [
	'It seems like one of the pies has been eaten by that snail.','1',
	'Defeat him to get it back!','1',
]
var can_interact = false
var has_been_played = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") && can_interact == true && has_been_played == false:
		play_welcome_dialog()
	#print(has_been_played)

func _on_WelcomeDialog_body_entered(body):
	if body.name == "Player":
		can_interact = true
		if has_been_played == false:
			play_welcome_dialog()
		
		
func play_welcome_dialog():
	if get_tree().get_current_scene().get_name() == "World1":
		play_dialog(welcomeDialog1)
	if get_tree().get_current_scene().get_name() == "World2":
		play_dialog(welcomeDialog2)

func play_dialog(dialog):
	get_node("/root/Dialog").load_dialog(dialog, dialog_index)
	dialog_index += 2
	if (dialog_index > dialog.size()):
		dialog_index = 0
		can_interact = false
		has_been_played = true

func _on_WelcomeDialog_body_exited(body):
	if body.name == "Player" && has_been_played == false:
		can_interact = false
		get_node("/root/Dialog").reset()
		dialog_index = 0
