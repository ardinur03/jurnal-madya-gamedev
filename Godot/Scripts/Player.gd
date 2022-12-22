extends KinematicBody

const GRAVITY = -24.8
var vel = Vector3()
var MAX_SPEED = 30
const JUMP_SPEED = 18
const ACCEL = 4.5

var dir = Vector3()

const DEACCEL= 16
const MAX_SLOPE_ANGLE = 40

var camera
var rotation_helper
var raycast
var current_scene

var MOUSE_SENSITIVITY = 0.1

func _ready():
	camera = $Head/Camera
	rotation_helper = $Head
	raycast = $Head/Camera/RayCast
	current_scene = get_tree().get_current_scene().get_name()

	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	process_input(delta)
	process_movement(delta)

func process_input(delta):
		
	# ----------------------------------
	# Walking
	dir = Vector3()
	var cam_xform = camera.get_global_transform()

	var input_movement_vector = Vector2()
	
	if Input.is_action_just_pressed("movement_forward"):
		MusicController.play_footstep_SE()
	if Input.is_action_just_released("movement_forward"):
		MusicController.stop_SE()
	
	if Input.is_action_just_pressed("movement_backward"):
		MusicController.play_footstep_SE()
	if Input.is_action_just_released("movement_backward"):
		MusicController.stop_SE()
	
	if Input.is_action_just_pressed("movement_left"):
		MusicController.play_footstep_SE()
	if Input.is_action_just_released("movement_left"):
		MusicController.stop_SE()
	
	if Input.is_action_just_pressed("movement_right"):
		MusicController.play_footstep_SE()
	if Input.is_action_just_released("movement_right"):
		MusicController.stop_SE()
	
	if Input.is_action_pressed("movement_forward"):
		input_movement_vector.y += 1
	if Input.is_action_pressed("movement_backward"):
		input_movement_vector.y -= 1
	if Input.is_action_pressed("movement_left"):
		input_movement_vector.x -= 1
	if Input.is_action_pressed("movement_right"):
		input_movement_vector.x += 1

	input_movement_vector = input_movement_vector.normalized()

	# Basis vectors are already normalized.
	dir += -cam_xform.basis.z * input_movement_vector.y
	dir += cam_xform.basis.x * input_movement_vector.x
	# ----------------------------------

	# ----------------------------------
	# Capturing/Freeing the cursor
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	# ----------------------------------
		

func process_movement(delta):
	if (current_scene == 'House'):
		MAX_SPEED = 20
	if (current_scene == 'Labyrinth'):
		MAX_SPEED = 10
	print(self.global_transform.origin)
	
	dir.y = 0
	dir = dir.normalized()

	vel.y += delta * GRAVITY

	var hvel = vel
	hvel.y = 0

	var target = dir
	target *= MAX_SPEED

	var accel
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL

	hvel = hvel.linear_interpolate(target, accel * delta)
	vel.x = hvel.x
	vel.z = hvel.z
	vel = move_and_slide(vel, Vector3(0, 1, 0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_helper.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY))
		self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))

		var camera_rot = rotation_helper.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -70, 70)
		rotation_helper.rotation_degrees = camera_rot
