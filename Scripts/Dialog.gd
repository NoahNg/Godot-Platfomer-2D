extends CanvasLayer

export(String, FILE, "*.tscn") var next_world
var dialog_index = 0
var finished = false
var ava_num = 0

func _process(delta):
	#pass
	$DialogBox/Polygon2D.visible = finished
	$DialogBox/Polygon2D/AnimationPlayer.play("Load")
	#if Input.is_action_just_pressed("ui_accept"):
		#load_dialog()
func show_ava_and_name(ava_num):
	if int(ava_num) == 0:
		$DialogBox/DagAva.visible = true
		$DialogBox/CatAva.visible = false
		$DialogBox/CharName.bbcode_text = "Dag"

	else:
		$DialogBox/DagAva.visible = false
		$DialogBox/CatAva.visible = true
		$DialogBox/CharName.bbcode_text = "Bebi"
		$DialogBox/CatSFX.play()
	

func load_dialog(dialog, dialog_index):
	$DialogBox.visible = true
	#print("dialog_index " + str(dialog_index))
	if dialog_index < dialog.size():
		#$DialogBox.show()
		finished = false
		#$DialogBox/Script.bbcode_text = dialog[dialog_index]
		get_node("DialogBox/Script").bbcode_text = dialog[dialog_index]
		#Animation for the text to appear
		get_node("DialogBox/Script").percent_visible = 0
		get_node("DialogBox/Tween").interpolate_property(
			get_node("DialogBox/Script"), "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		
		dialog_index += 1
		ava_num= dialog[dialog_index]
		show_ava_and_name(ava_num)

		get_node("DialogBox/Tween").start()
		
		#$DialogBox/Script.percent_visible = 0
		#$DialogBox/Tween.interpolate_property(
			#$DialogBox/Script, "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		#)
		#$DialogBox/Tween.start()
		dialog_index += 1 #To show the next line the next time player presses Enter
	else:
		reset()
	
func _on_Tween_tween_completed(object, key):
	finished = true
	
func show_Buttons():
	$NotReadyButton.visible = true
	$ReadyButton.visible = true
	
func reset():
	#get_node("DialogBox").visible = false
	$DialogBox.visible = false
	
	$NotReadyButton.visible = false
	$ReadyButton.visible = false

#Dialog for the kitchen scene
func load_dialog_Intro(dialog, dialog_index):
	$DialogBox.visible = true
	if dialog_index < dialog.size():
		finished = false
		get_node("DialogBox/Script").bbcode_text = dialog[dialog_index]
		
		#Animation for the text to appear
		get_node("DialogBox/Script").percent_visible = 0
		get_node("DialogBox/Tween").interpolate_property(
			get_node("DialogBox/Script"), "percent_visible", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)
		
		dialog_index += 1
		ava_num= dialog[dialog_index]
		show_ava_and_name(ava_num)
		
		get_node("DialogBox/Tween").start()
		
		if dialog_index == dialog.size() - 1:
			show_Buttons()
		dialog_index += 1 #To show the next line the next time player presses Enter
		
	else:
		reset()

		
func _on_NotReadyButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			get_node("/root/Freya").can_interact = false
			reset()


func _on_ReadyButton_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			#var next = get_parent().next_world
			#get_tree().change_scene(next_world)
			get_tree().change_scene("res://Scenes/World1.tscn")
			#get_tree().change_scene(next)
