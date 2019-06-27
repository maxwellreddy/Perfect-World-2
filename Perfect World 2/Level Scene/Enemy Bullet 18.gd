extends KinematicBody2D

var x = 0
var y = 0
var timer = 0
var id = 0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	
	if get_pos().x < -250 or get_pos().x > 900:
		queue_free()
	if get_pos().y < -300 or get_pos().y > 1000:
		queue_free()