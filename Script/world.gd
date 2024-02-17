extends Node2D

@onready var tile_map = $TileMap
var source_id_land = 0
var source_id_water = 1
var land_atlas = Vector2i(1,1)
var water_atlas = Vector2i(0,0)
var sand_tiles_arr = []
var land_tiles_arr = []
var land_tiles_int = 0
var sand_tiles_int = 1


@export var noise_height_text : NoiseTexture2D

var noise : Noise

var width : int = 200
var height : int = 200

func _ready():
	noise=noise_height_text.noise
	generate_world()
	
func generate_world():
	for x in range(width):
		for y in range(height):
			var noise_val : float = noise.get_noise_2d(x,y)
			# Place la terre
			if noise_val > 0.0:
				tile_map.set_cell(2,Vector2i(x,y),source_id_land,land_atlas)
			# Place le sable et les petits movements d'eau
			elif noise_val > -0.15 and noise_val < 0.0:
				sand_tiles_arr.append(Vector2i(x,y))
				tile_map.set_cell(1,Vector2i(x,y),2,Vector2i(0,0))
			# Place l'eau
			else:
				tile_map.set_cell(0,Vector2i(x,y),source_id_water,water_atlas)
	tile_map.set_cell(1,Vector2i(4,4),3,Vector2i(0,0))
	tile_map.set_cells_terrain_connect(2,sand_tiles_arr,sand_tiles_int,0)



