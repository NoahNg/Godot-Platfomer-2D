extends Area2D

var can_interact = false
var dialog_index = 0

const DIALOG = preload("res://Scenes/Dialog-Main.tscn")
var dialog = [
	'A BEBI!', '0',
	'I wanna scoop', '0' ,
	'Please don\'t', '1'
]

var dialogIntro = [
	'Hi Dag, I have intel for you about the perfect pie.','1',
	'Really??','0',
	'It\'s in McGrubor\'s forest in the north. Do you want to come with me?','1',
	'Oh absolutely! I better go get ready then.','0',
	'Are you ready for your adventure, Dag?', '1',
	'(Choose an option)','0'
]


func _physics_process(delta):
	$AnimatedSprite.play("Idle")
	
	
func _on_Freya_body_entered(body):
	if body.name == "Player":
		can_interact = true
		$Label.visible = true


func _on_Freya_body_exited(body):
	if body.name == "Player":
		can_interact = false
		$Label.visible = false
		get_node("/root/Dialog").reset()
		dialog_index = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and can_interact == true:
		$Label.visible = false
		#play_current_scene_dialog()
		play_intro_dialog(dialogIntro)
		
		
			
func play_current_scene_dialog():
	get_node("/root/Dialog").load_dialog(dialog, dialog_index)
	dialog_index += 2
	if (dialog_index > dialog.size()):
		dialog_index = 0
		can_interact = false
			
func play_intro_dialog(dialog):
	get_node("/root/Dialog").load_dialog_Intro(dialog, dialog_index)
	dialog_index += 2
	if (dialog_index > dialog.size()):
		dialog_index = 0
		can_interact = false
