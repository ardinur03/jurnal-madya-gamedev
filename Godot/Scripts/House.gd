extends Spatial

func _ready():
	var environment = get_tree().root.world.fallback_environment
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color.black
	environment.ambient_light_color = Color("432d6d")
	#environment.dof_blur_far_enabled = true
	#environment.dof_blur_near_enabled = true
