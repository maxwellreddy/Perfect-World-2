extends KinematicBody2D

var x = 0
var y = 0
var timer = 0
var orig_x = 0
var orig_y = 0
var orig_rot = 0
var id = 0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	if timer <= 20:
		set_pos(Vector2(get_pos().x + x * ((4 - id)), get_pos().y + y * ((4 - id))))
	else:
		set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	
	if get_pos().x < 0 or get_pos().x > 680:
		queue_free()
	if get_pos().y < -100 or get_pos().y > 750:
		queue_free()