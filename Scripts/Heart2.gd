extends Sprite

func _ready():
	pass # Replace with function body.
	
func _physics_process(delta):
	if get_node("/root/MainHud").lives == 1:
		#queue_free()
		$".".hide()
	if get_node("/root/MainHud").lives == 0 || get_node("/root/MainHud").lives == 3:
		$".".show()

