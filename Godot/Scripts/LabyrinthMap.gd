extends Spatial

const Cell = preload("res://Scenes/Cell.tscn")

export(PackedScene) var Map

var cells = []

func _ready():
	var environment = get_tree().root.world.fallback_environment
	environment.background_mode = Environment.BG_COLOR
	environment.background_color = Color.black
	environment.ambient_light_color = Color("432d6d")
	environment.dof_blur_far_enabled = true
	environment.dof_blur_near_enabled = true
	MusicController.play_labyrinthmap_BGM()
	generate_map()

func generate_map():
	if not Map is PackedScene: return
	var map = Map.instance()
	var tileMap = map.get_tilemap()
	var used_tiles = tileMap.get_used_cells()
	#map.free() # We don't need it now that we have the tile data
	
	# Generate Setiap Tile dengan Asset yang ditentukan
	for tile in used_tiles:
		var cell = Cell.instance()
		cell.translation = Vector3(tile.x*Globals.GRID_SIZE, 0, tile.y*Globals.GRID_SIZE)
		cells.append(cell)
		add_child(cell)
	
	# Generate Map
	for cell in cells:
		cell.update_faces(used_tiles)
