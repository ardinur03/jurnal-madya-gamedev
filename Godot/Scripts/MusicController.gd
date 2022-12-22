extends Node2D
# Background Music

###############################################################################

# Main Menu BGM
func play_mainmenu_BGM():
	var mainmenu = load("res://Assets/SoundEffects/mainmenu/main_menu.mp3")
	if $Music.stream != mainmenu:
		$Music.stream = mainmenu
		$Music.play()

# HouseMAP BGM
func play_housemap_BGM():
	var housemap = load("res://Assets/SoundEffects/hujan/rain.mp3")
	$Music.stream = housemap
	$Music.play()

# Labyrinth
func play_labyrinthmap_BGM():
	var labyrinth = load("res://Assets/SoundEffects/mainmenu/labyrinth.mp3")
	$Music.stream = labyrinth
	$Music.play()

###############################################################################
# Foostep SE
func play_footstep_SE():
	var footstep = load("res://Assets/SoundEffects/karakter/v2_jalan_kaki.mp3")
	$SoundEffect.stream = footstep
	$SoundEffect.play()

# Collect Key
func play_key_SE():
	var collectkey = load("res://Assets/SoundEffects/karakter/getkey.mp3")
	$SoundEffect.stream = collectkey
	$SoundEffect.play()

###############################################################################	
func stop_SE():
	$SoundEffect.stop()

###############################################################################	
func stop_BGM():
	$Music.stop()
	
""""###############################################################################

# Main Menu BGM
var music_mainmenu = load("res://Assets/Music/mainMenu_BGM.mp3")
func play_mainmenu_music():
	$music.stream = music_mainmenu
	$music.play()
	
###############################################################################

# Click Button
var sound_buttonClick = load("res://Assets/Music/buttonClick.mp3")
func play_buttonClick_sound():
	$sound_effect.stream = sound_buttonClick
	$sound_effect.play()"""
	
###############################################################################
