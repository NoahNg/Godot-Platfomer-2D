extends Node2D


# Declare member variables here.
var score = 0 setget set_score
var lives = 3 setget set_lives
var can_interact = false
var dialog_index = 0
var has_been_played = false
var deadDialog = [
	'I thought I had warned you Dag...','1'
]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	#if lives == 0:
		#get_parent().get_node("Player/CollisionShape2D").disabled = true
		#get_parent().get_node("Player").hide()
	if lives == 0 and has_been_played == false:
		play_dead_dialog()
		has_been_played = true
	if Input.is_action_just_pressed("ui_accept") && has_been_played == true:
		get_tree().change_scene("res://Scenes/GameOver.tscn")
		has_been_played = false
		
		#can_interact = true
		
			#play_dead_dialog()
		

func reset():
	get_node("/root/MainHud").lives = 3
	score = 0
	print("Reset")
	
func play_dead_dialog():
	get_node("/root/Dialog").load_dialog(deadDialog, dialog_index)
	dialog_index += 2
	if (dialog_index > deadDialog.size()):
		dialog_index = 0
		can_interact = false
		get_node("/root/Dialog").reset()
		

		reset()
	

func set_score(value):
	score = value
	$HUD/Score.set_text(str(score))
	pass
	
func set_lives(value):
	lives = value
	#if lives == 0:
		#get_tree().change_scene("res://Scenes/GameOver.tscn")
		#lives = 3#reset
		#print("Reset")
		



func _on_ExitButton_input_event(viewport, event, shape_idx):
		if event is InputEventMouseButton:
			if event.is_pressed():
				reset()
				get_tree().quit()


func _on_MenuButton_input_event(viewport, event, shape_idx):
		if event is InputEventMouseButton:
			if event.is_pressed():
				if Hole.has_been_played == false:
					Dialog.reset()
				reset()
				get_tree().change_scene("res://Scenes/Introduction.tscn")
