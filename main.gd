extends Node2D

# Game Variables
const DINO_START_POS := Vector2i(150, 485)
const CAMERA_START_POS := Vector2i(576, 324)

var speed: float
const START_SPEED: float = 10.0
const MAX_SPEED: float = 25

var screen_size: Vector2i

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_window().size
	new_game()
	
#
func new_game() -> void:
	$Dino.position = DINO_START_POS
	$Dino.velocity = Vector2i(0, 0)
	$Camera.position = CAMERA_START_POS
	$Ground.position = Vector2i(0, 0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed = START_SPEED
	
	# Move Dino & Camera
	$Dino.position.x += speed
	$Camera.position.x += speed

	# Update Ground pos
	if $Camera.position.x - $Ground.position.x > screen_size.x * 1.5:
		$Ground.position.x += screen_size.x
		
	
