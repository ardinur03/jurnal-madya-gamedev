extends Spatial

var rain

func _ready():
	if (Globals.isFinished == false):
		var environment = get_tree().root.world.fallback_environment
		environment.background_mode = Environment.BG_COLOR
		environment.background_color = Color.black
		environment.ambient_light_color = Color("432d6d")
		#environment.dof_blur_far_enabled = true
		#environment.dof_blur_near_enabled = true
		MusicController.play_housemap_BGM()
	else:
		get_node("/root/House/HouseMap/Particles").visible = false
		var environment = get_tree().root.world.fallback_environment
		environment.background_mode = Environment.BG_CLEAR_COLOR
		environment.background_color = Color("#87ceeb")
		#environment.ambient_light_color = Color("432d6d")
		#environment.dof_blur_far_enabled = true
		#environment.dof_blur_near_enabled = true
		MusicController.play_housemapend_BGM()
