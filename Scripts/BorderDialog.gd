extends Area2D

var dialog_index = 0
var borderDialog = [
	'This is not the right way to go Dag.', '1',
	'Please turn around.', '1']

var can_interact = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _process(delta):
	if Input.is_action_just_pressed("ui_accept") && can_interact == true:
		play_border_dialog()
	pass


func play_border_dialog():
	get_node("/root/Dialog").load_dialog(borderDialog, dialog_index)
	dialog_index += 2
	if (dialog_index > borderDialog.size()):
		dialog_index = 0
		can_interact = false
		print(dialog_index)
	
	
func _on_BorderDialog_body_entered(body):
	if body.name == "Player":
		print("Player entered")
		can_interact = true
		play_border_dialog()


func _on_BorderDialog_body_exited(body):
	if body.name == "Player":
		print("Player exited")
		can_interact = false
		get_node("/root/Dialog").reset()
		dialog_index = 0
