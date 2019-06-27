extends RigidBody2D
var timer = 0
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	set_pos(Vector2(get_pos().x, get_pos().y))
	timer += 1
	if timer >= 0 and timer < 30:
		set_opacity(timer * 0.033)
	elif timer == 30:
		set_opacity(0.9)
	elif timer > 30 and timer < 180:
		set_opacity(0.9 - (timer * 0.006))
	elif timer >= 180:
		queue_free()
		
	if timer >= 0 and timer <= 180:
		for bodies in get_tree().get_root().get_children():
			if bodies.is_in_group("enemy bullet") or bodies.is_in_group("enemy bullet 2") or bodies.is_in_group("enemy bullet 3") or (bodies.is_in_group("enemy bullet 6") and bodies.id == 0) or (bodies.is_in_group("enemy bullet 6") and bodies.id == 1 and bodies.timer > 70):
				bodies.queue_free()
		