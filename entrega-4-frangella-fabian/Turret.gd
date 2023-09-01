extends Area2D

export(PackedScene) var bullet_scene

func _on_ShootTimer_timeout():
	var bullet = bullet_scene.instance()
	bullet.linear_velocity = Vector2(250.0, 250.0)
