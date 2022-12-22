extends Control

func _ready():
	Globals.isFinished = false
	MusicController.play_mainmenu_BGM()

func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/Underground.tscn");
