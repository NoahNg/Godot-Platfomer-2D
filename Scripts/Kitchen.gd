extends Node2D
export(String, FILE, "*.tscn") var next_world



# Called when the node enters the scene tree for the first time.
func _ready():
	
	Music.play_music()
	WelcomeDialog.has_been_played = true

