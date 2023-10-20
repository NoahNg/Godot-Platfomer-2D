extends Node2D


var can_interact = false
var gonextworld = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.global_position = Vector2(22,172)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#get_tree().get_root().set_disable_input(true)
	if gonextworld == false:
		$Bebi.play("default")

	if can_interact == true && get_node("Puzzle").finished == false:
		get_node("Player").MAX_SPEED = 0
		$Puzzle/Control.show()
	if get_node("Puzzle").finished == true:
		can_interact = false
		get_node("Player").MAX_SPEED = 150
		$Area2D/CollisionShape2D.disabled = true
	else:
		$Area2D/CollisionShape2D.disabled = false
		

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		can_interact = true
		
func _on_Area2D_body_exited(body):
	can_interact = false
	#$Area2D/Puzzle.get_child(0).hide()
