extends Sprite

var speed = 200 #Pixeles

var _time_since_last_shoot
var _time_per_bullet = 100

signal shoot;

func _ready():
	_time_since_last_shoot = 0

func _physics_process(delta):
	# Manera básica
	var direction:int = 0
	if Input.is_action_pressed("move_left"):
		direction = -1
	elif Input.is_action_pressed("move_right"):
		direction = 1
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	position.x += direction_optimized * speed * delta
	
	if Input.is_action_pressed("shoot") && OS.get_ticks_msec() - _time_since_last_shoot > _time_per_bullet:
		emit_signal("shoot")
		_time_since_last_shoot = OS.get_ticks_msec()
