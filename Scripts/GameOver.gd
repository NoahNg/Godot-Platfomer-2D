extends Node2D


#var scene = get_node("/root/MainHud").current_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	Music.play_menu_music()

func _on_RetryButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Kitchen.tscn")
			#if scene == "Kitchen":
				
			#if scene == "World1":
				#get_tree().change_scene("res://Scenes/World1.tscn")
			#if scene == "World2":
				#get_tree().change_scene("res://Scenes/World2.tscn")
	pass # Replace with function body.


func _on_MenuButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_tree().change_scene("res://Scenes/Introduction.tscn")
	pass # Replace with function body.
