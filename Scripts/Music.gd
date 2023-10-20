extends Node

var menu_music = load("res://Photos/bit_forrest_intro.mp3")
var game_music = load("res://Photos/8 Bit Adventure.mp3")

func play_music():
	$AudioStreamPlayer.stream = game_music
	$AudioStreamPlayer.volume_db = -12
	$AudioStreamPlayer.play()
	
func play_menu_music():
	$AudioStreamPlayer.stream = menu_music
	$AudioStreamPlayer.volume_db = -10
	
	$AudioStreamPlayer.play()
