extends KinematicBody2D

var x = 0
var y = 0
var timer = 0
var timer2 = 0
var timer3 = 0
var orig_rot = 0
var id = 0
var rot = 0
var explode = false
var scaleX1 = 0
var scaleX2 = 0
var scaleY1 = 0
var scaleY2 = 0
var angle = 0
var x_move = 0
var y_move = 0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer2 += 1
	set_rot(timer2)
	if timer2 == 105:
		get_child(2).play("se_option")
	if explode == true:
		timer3 += 1
	if explode == false:
		set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	elif explode == true and timer < 12 :
		set_scale(Vector2(get_child(0).get_scale().x + timer * 0.5, get_child(0).get_scale().y + timer * 0.5))
		set_scale(Vector2(get_child(1).get_scale().x + timer * 0.5, get_child(1).get_scale().y + timer * 0.5))
		scaleX1 = get_child(0).get_scale().x + timer * 0.5
		scaleX2 = get_child(1).get_scale().x + timer * 0.5
		scaleY1 = get_child(0).get_scale().y + timer * 0.5
		scaleY2 = get_child(1).get_scale().y + timer * 0.5
		timer += 1
	if timer3 == 240:
		x_move = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
		y_move = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
		if x_move <= 0:
			angle = atan(y_move/x_move) + PI
		else:
			angle = atan(y_move/x_move)
	if timer3 > 240:
		
		set_scale(Vector2(scaleX1 - (timer3 - 240) * 0.03, scaleY1 - (timer3 - 240) * 0.03))
		set_scale(Vector2(scaleX2 - (timer3 - 240) * 0.03, scaleY2 - (timer3 - 240) * 0.03))
		timer3 += 1
		if scaleX1 - (timer3 - 240) * 0.033 < 0:
			queue_free()
		
		var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
		var displacement = pow(hypotenuse, 0.5)
		var n = displacement / 3
		set_pos(Vector2(get_pos().x + (x_move / n), get_pos().y + (y_move / n)))
	if get_pos().x < 20 or get_pos().x > 660 or get_pos().y > 680 or get_pos().y < 40:
		queue_free()