extends KinematicBody2D
var x = 0
var y = 0
var z = 0
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	z -= 10
	if z <= -800:
		queue_free()