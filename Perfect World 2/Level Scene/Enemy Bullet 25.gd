extends KinematicBody2D

var x = 0
var y = 0
var orig_x = 0
var orig_y = 0
var timer = 0
var timer2 = 0
var angle = 0
var radius = 0
var id = 0
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	if timer < 2:
		set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	elif timer == 2:
		var x_diff = get_pos().x - orig_x
		var y_diff = get_pos().y - orig_y
		if x_diff <= 0:
			angle = atan(x_diff/y_diff) + PI
		else:
			angle = atan(x_diff/y_diff)
		
		var hypotenuse = pow(x_diff, 2) + pow(y_diff, 2)
		radius = pow(hypotenuse, 0.5)
		angle += 2 * PI
		set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	else:
		angle += 0.008
		set_pos(Vector2(orig_x + (radius * cos(angle)), orig_y + (radius * sin(angle))))
		radius += 2 * (id * 0.5)
	if id == 1 and timer >= 620:
		queue_free()
	if id == 2 and timer >= 420:
		queue_free()
	if id == 3 and timer >= 220:
		queue_free()