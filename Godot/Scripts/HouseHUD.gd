extends Control

var raycast 
var correctHouse : Object
var correctHouseHUD 

func _ready():
	raycast = $"/root/House/Player/Head/Camera/RayCast"
	correctHouse = $"/root/House/HouseMap/Rumah/StaticBody"
	correctHouseHUD = $"/root/House/HUD/House"
	Globals.PlayerHasKey = false
	
func _process(delta):
	if(raycast.get_collider() == correctHouse):
		correctHouseHUD.visible = true
	else:
		correctHouseHUD.visible = false
		
	if(raycast.get_collider() == correctHouse && Input.is_action_just_pressed("left_click")):
		get_tree().change_scene("res://Scenes/LabyrinthMap.tscn")
