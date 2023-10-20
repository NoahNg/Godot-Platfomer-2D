extends Node2D

func _ready():
	#Music.play_menu_music()
	pass

func _on_BackButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Controls.tscn")


func _on_NextButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Obstacles.tscn")
