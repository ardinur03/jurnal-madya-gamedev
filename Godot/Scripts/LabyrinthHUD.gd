extends Control

var raycast 
var key : Object
var keyView
var keyHUD
var keyInfo
var timeInfo
var ms 
var s 
var m 
var h 

func _ready():
	raycast = $"/root/Labyrinth/Player/Head/Camera/RayCast"
	key = $"/root/Labyrinth/Key/Body/StaticBody"
	keyHUD = $"/root/Labyrinth/HUD/Key"
	keyInfo = $"/root/Labyrinth/HUD/KeyInfo"
	keyView = $"/root/Labyrinth/Key"
	timeInfo = $TimeInfo
	
	ms = 0
	s = 0
	m = 0
	h = 0
	
func _process(delta):
	if(raycast.get_collider() == key):
		keyHUD.visible = true
	else:
		keyHUD.visible = false
		
	if(raycast.get_collider() == key && Input.is_action_just_pressed("left_click")):
		MusicController.play_key_SE()
		keyInfo.visible = true
		Globals.PlayerHasKey = true
		keyView.visible = false
		key.global_transform.origin = Vector3(-999,-999,-999)
	
	if ms > 9:
		s += 1
		ms = 0

	if s > 59:
		m += 1
		s = 0

	if m > 59:
		h += 1
		m = 0

	timeInfo.set_text(str(h) + ":" + str(m) + ":" + str(s))


func _on_Timer_timeout():
	ms += 1
