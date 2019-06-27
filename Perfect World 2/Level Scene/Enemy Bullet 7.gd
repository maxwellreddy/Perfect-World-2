extends KinematicBody2D

var timer = 0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	set_rot(timer * 0.2)
	set_pos(Vector2(get_pos().x, get_pos().y + 2 ))
	if timer >= 1 and timer < 50:
		set_scale(Vector2(0.02 * timer, 0.02 * timer))
	else:
		set_scale(Vector2(1, 1))
	if get_pos().y > 1000:
		queue_free()