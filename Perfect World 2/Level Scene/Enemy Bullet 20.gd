extends KinematicBody2D

var x = 0
var y = 0
var timer = 0
var orig_x = 0
var orig_y = 0
var orig_rot = 0
var id = 0
var rot = 0
var randx = 0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	if id == 0:
		set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	else:
		if timer <= 50:
			set_pos(Vector2(get_pos().x + 0, get_pos().y + 0))
			set_opacity(timer * 0.01)
		elif timer > 50 and timer <= 70:
			set_pos(Vector2(get_pos().x + 0, get_pos().y + 0))
			set_opacity(0.5)
		elif timer > 70:
			set_pos(Vector2(get_pos().x + x * ((timer - 70) * 0.005), get_pos().y + y * ((timer - 70) * 0.005)))
			set_opacity(1)
	if get_pos().x < -300 or get_pos().x > 950 or get_pos().y > 670 or get_pos().y < 50:
		queue_free()