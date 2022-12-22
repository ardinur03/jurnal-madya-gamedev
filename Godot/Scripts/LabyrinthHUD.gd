extends Control

var raycast 
var key : Object
var door
var keyView
var keyHUD
var keyInfo
var timeInfo
var doorHUD
var note1
var note2
var note3
var note4
var note5
var note1View
var note2View
var note3View 
var note4View 
var note5View 
var noteInfo
var sumNote
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
	door = $"/root/Labyrinth/Door/StaticBody"
	doorHUD = $"/root/Labyrinth/HUD/Door"
	note1 = $"/root/Labyrinth/Note1/StaticBody"
	note2 = $"/root/Labyrinth/Note2/StaticBody"
	note3 = $"/root/Labyrinth/Note3/StaticBody"
	note4 = $"/root/Labyrinth/Note4/StaticBody"
	note5 = $"/root/Labyrinth/Note5/StaticBody"
	note1View = $"/root/Labyrinth/Note1"
	note2View = $"/root/Labyrinth/Note2"
	note3View = $"/root/Labyrinth/Note3"
	note4View = $"/root/Labyrinth/Note4"
	note5View = $"/root/Labyrinth/Note5"
	
	noteInfo = $Note
	timeInfo = $TimeInfo
	sumNote = 0
	Globals.PlayerHasKey = false
	
	ms = 0
	s = 0
	m = 0
	h = 0
	
func _process(delta):
	if(sumNote == 5):
		keyView.visible = true
	
	if(sumNote < 5 || sumNote > 5):
		keyView.visible = false
		
	if(Globals.PlayerHasKey == false):
		get_node("Door").set_text("Membutuhkan Kunci")
	else:
		get_node("Door").set_text("Kabur Sekarang")
		
	if (raycast.get_collider() == door && Input.is_action_just_pressed("left_click") && Globals.PlayerHasKey == false):
		MusicController.play_lockedkey_SE()
	if (raycast.get_collider() == door && Input.is_action_just_pressed("left_click") && Globals.PlayerHasKey == true):
		MusicController.play_opendoor_SE()
		Globals.isFinished = true
		get_tree().change_scene("res://Scenes/HouseMap.tscn")
	
	if (raycast.get_collider() == note1 && Input.is_action_just_pressed("left_click")):
		sumNote += 1
		note1.global_transform.origin = Vector3(-999,-999,-999)
		note1View.visible = false
		noteInfo.set_text(str(sumNote) + 'x')
		MusicController.play_getnote_SE()
	if (raycast.get_collider() == note2 && Input.is_action_just_pressed("left_click")):
		sumNote += 1
		note2.global_transform.origin = Vector3(-999,-999,-999)
		note2View.visible = false
		noteInfo.set_text(str(sumNote) + 'x')
		MusicController.play_getnote_SE()
	if (raycast.get_collider() == note3 && Input.is_action_just_pressed("left_click")):
		sumNote += 1
		note3.global_transform.origin = Vector3(-999,-999,-999)
		note3View.visible = false
		noteInfo.set_text(str(sumNote) + 'x')
		MusicController.play_getnote_SE()
	if (raycast.get_collider() == note4 && Input.is_action_just_pressed("left_click")):
		sumNote += 1
		note4.global_transform.origin = Vector3(-999,-999,-999)
		note4View.visible = false
		noteInfo.set_text(str(sumNote) + 'x')
		MusicController.play_getnote_SE()
	if (raycast.get_collider() == note5 && Input.is_action_just_pressed("left_click")):
		sumNote += 1
		note5.global_transform.origin = Vector3(-999,-999,-999)
		note5View.visible = false
		noteInfo.set_text(str(sumNote) + 'x')
		MusicController.play_getnote_SE()
	
	if(raycast.get_collider() == door):
		doorHUD.visible = true
	else:
		doorHUD.visible = false
	
	if(raycast.get_collider() == key):
		keyHUD.visible = true
	else:
		keyHUD.visible = false
		
	if(raycast.get_collider() == key && Input.is_action_just_pressed("left_click")):
		MusicController.play_getkey_SE()
		keyInfo.visible = true
		Globals.PlayerHasKey = true
		keyView.visible = false
		key.global_transform.origin = Vector3(-999,-999,-999)
		sumNote = 6;
	
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

	update()

func _on_Timer_timeout():
	ms += 1
