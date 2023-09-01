extends Area2D

export(PackedScene) var bullet_scene

var _time_since_last_shoot
var speed = 2

func _physics_process(delta):
	$Sprite.look_at(get_global_mouse_position())

func _on_Player_shoot():
	var bullet = bullet_scene.instance()
	var direction = get_global_mouse_position() - get_parent().get_position()
	bullet.linear_velocity = direction * speed
	add_child(bullet)
