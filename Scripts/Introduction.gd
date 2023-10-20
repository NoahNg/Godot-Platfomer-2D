extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	
	
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	Music.play_menu_music()


func _on_PlayButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Kitchen.tscn")



func _on_HowToPlayButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Controls.tscn")



func _on_StoryButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Story.tscn")

