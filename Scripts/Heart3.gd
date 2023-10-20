extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if get_node("/root/MainHud").lives == 2 || get_node("/root/MainHud").lives == 1:
		$".".hide()
	if get_node("/root/MainHud").lives == 0 || get_node("/root/MainHud").lives == 3:
		$".".show()
		
		#queue_free()
