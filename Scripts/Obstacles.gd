extends Node2D

func _ready():
	#Music.play_menu_music()
	pass
	
func _on_BackButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Objective.tscn")


func _on_MenuButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Introduction.tscn")
