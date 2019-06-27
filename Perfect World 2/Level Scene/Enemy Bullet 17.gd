extends KinematicBody2D

var x = 0
var y = 0
var marker_x = 0
var marker_y = 0
var timer = 0
var timer2 = 0
var angle = 0
var radius = 0
const enemy_shot_18 = preload("res://Level Scene/Enemy Bullet 18.tscn")
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	timer += 1
	if timer < 25:
		set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	elif timer >= 25 and timer < 70:
		x = x * 0.95
		y = y * 0.95
		set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	elif timer >= 70 and timer < 105:
		x = x * 1.05
		y = y * 1.05
		set_pos(Vector2(get_pos().x - x, get_pos().y - y))
	elif timer >= 105 and timer < 125:
		set_pos(Vector2(get_pos().x + 0, get_pos().y + 0))
	elif timer == 125:
		var x_diff = get_pos().x - marker_x
		var y_diff = get_pos().y - marker_y
		if x_diff <= 0:
			angle = atan(x_diff/y_diff) + PI
		else:
			angle = atan(x_diff/y_diff)
		
		var hypotenuse = pow(x_diff, 2) + pow(y_diff, 2)
		radius = pow(hypotenuse, 0.5)
		angle += 2 * PI
	else:
		timer2 += 1
		angle += 0.01
		set_pos(Vector2(marker_x + (radius * cos(angle)), marker_y + (radius * sin(angle))))
		if timer > 175:
			radius += 5;
		if timer2 == 5:
			get_child(2).play("se_tan02")
			var shot1 = enemy_shot_18.instance()
			shot1.set_pos(get_pos())
			var angle2 = angle + PI
			var x_move = cos(angle2)
			var resolve = x_move
			var y_move = sin(angle2)
				
			var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
			var displacement = pow(hypotenuse, 0.5)
				
			var n = displacement / 8
			
			if y_move > 0:
				shot1.set_rot(atan(x_move/y_move))
			elif y_move < 0:
				shot1.set_rot(atan(x_move/y_move) + PI)
						
			shot1.x = -x_move / n
			shot1.y = -y_move / n
				
			get_tree().get_root().add_child(shot1)
			#######################################################################
			"""
			var shot1 = enemy_shot_18.instance()
			shot1.set_pos(get_pos())
			var angle2 = angle + (PI / 2)
			var x_move = cos(angle2)
			var resolve = x_move
			var y_move = sin(angle2)
				
			var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
			var displacement = pow(hypotenuse, 0.5)
				
			var n = displacement / 8
			
			if y_move > 0:
				shot1.set_rot(atan(x_move/y_move))
			elif y_move < 0:
				if x_move > 0:
					shot1.set_rot(acos(y_move/displacement))
				elif x_move < 0:
					shot1.set_rot(atan(x_move/y_move) + PI)
				else:
					shot1.set_rot(PI)
			else:
				if x_move > 0:
					shot1.set_rot(PI/2)
				elif x_move < 0:
					shot1.set_rot((PI * 3) / 2)
						
			if y_move != 0:
				if angle2 <= (PI / 2):
					shot1.x = (x_move / n)
					shot1.y = y_move / n
				else:
					shot1.x = -(x_move / n) 
					shot1.y = -(y_move / n)
			else:
				if resolve > 0:
					shot1.x = cos(PI/4) * 10
					shot1.y = -(sin(PI/4) * 10)
				elif resolve <= 0:
					shot1.x = -(cos(PI/4) * 10)
					shot1.y = sin(PI/4) * 10
				
			get_tree().get_root().add_child(shot1)
			"""
			timer2 = 0
	
	if get_pos().x < -250 or get_pos().x > 900:
		queue_free()
	if get_pos().y < -300 or get_pos().y > 1000:
		queue_free()