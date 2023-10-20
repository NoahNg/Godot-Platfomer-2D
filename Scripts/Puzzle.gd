extends CanvasLayer


var score = 0
var finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$".".get_child(0).hide()
	if score == 5:
		finished = true
		print("finished")
		#queue_free()
		reset()
		
func reset():
	$Control/CheckMark.hide()
	$Control/CheckMark2.hide()
	$Control/CheckMark3.hide()
	$Control/CheckMark4.hide()
	$Control/CheckMark5.hide()
	$Control/CheckMark6.hide()
	$Control/CheckMark7.hide()
	$Control/CheckMark8.hide()
	$Control/CheckMark9.hide()
	$Control/CheckMark10.hide()
	$Control/D0/CollisionShape2D.disabled = false
	$Control/D0/CollisionShape2D2.disabled = false
	$Control/D1/CollisionShape2D.disabled = false
	$Control/D1/CollisionShape2D2.disabled = false
	$Control/D2/CollisionShape2D.disabled = false
	$Control/D2/CollisionShape2D2.disabled = false
	$Control/D3/CollisionShape2D.disabled = false
	$Control/D3/CollisionShape2D2.disabled = false
	$Control/D4/CollisionShape2D.disabled = false
	$Control/D4/CollisionShape2D2.disabled = false
	$Control.hide()
	score = 0
	#finished = false
	print("reset")
	

func _on_D0_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			$Control/Correct.play()
			$Control/CheckMark.show()
			$Control/CheckMark2.show()
			$Control/D0/CollisionShape2D.disabled = true
			$Control/D0/CollisionShape2D2.disabled = true
			score +=1


func _on_D1_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			$Control/Correct.play()
			$Control/CheckMark3.show()
			$Control/CheckMark4.show()
			$Control/D1/CollisionShape2D.disabled = true
			$Control/D1/CollisionShape2D2.disabled = true
			score +=1


func _on_D2_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			$Control/Correct.play()
			$Control/CheckMark5.show()
			$Control/CheckMark6.show()
			$Control/D2/CollisionShape2D.disabled = true
			$Control/D2/CollisionShape2D2.disabled = true
			score +=1


func _on_D3_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			$Control/Correct.play()
			$Control/CheckMark7.show()
			$Control/CheckMark8.show()
			$Control/D3/CollisionShape2D.disabled = true
			$Control/D3/CollisionShape2D2.disabled = true
			score +=1

func _on_D4_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			$Control/Correct.play()
			$Control/CheckMark9.show()
			$Control/CheckMark10.show()
			$Control/D4/CollisionShape2D.disabled = true
			$Control/D4/CollisionShape2D2.disabled = true
			score +=1
