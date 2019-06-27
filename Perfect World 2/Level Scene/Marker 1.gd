extends RigidBody2D
var resolve = 0
var angle = 0
var x_move = 0
var y_move = 0
var id = 0
const enemy_shot_17 = preload("res://Level Scene/Enemy Bullet 17.tscn")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	for bodies in get_colliding_bodies():
		if bodies.is_in_group("enemy bullet 4") and bodies.id == id:
			get_child(2).play("se_enep02")
			bodies.set_pos(get_pos())
			bodies.explode = true
			var fake_x = rand_range(40, 640)
			var fake_y = rand_range(60, 660)
			for i in range(0, 16):
				var shot1 = enemy_shot_17.instance()
				shot1.set_pos(get_pos())
				shot1.marker_x = get_pos().x
				shot1.marker_y = get_pos().y
				resolve = fake_x
				var x_move = fake_x
				var y_move = fake_y
				angle = atan(x_move/y_move) + (i * PI / 16)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				
				var n = displacement / 6
					
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
					if angle <= (PI / 2):
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
				############################################
				var shot1 = enemy_shot_17.instance()
				shot1.set_pos(get_pos())
				shot1.marker_x = get_pos().x
				shot1.marker_y = get_pos().y
				var resolve = fake_x
				var x_move = fake_x
				var y_move = fake_y
				angle = atan(x_move/y_move) + (i * PI / 16)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
					
				var n = displacement / 6
					
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
					if angle <= (PI / 2):
						shot1.x = -(x_move / n)
						shot1.y = -y_move / n
					else:
						shot1.x = (x_move / n) 
						shot1.y = (y_move / n)
				else:
					if resolve > 0:
						shot1.x = -cos(PI/4) * 10
						shot1.y = (sin(PI/4) * 10)
					elif resolve <= 0:
						shot1.x = (cos(PI/4) * 10)
						shot1.y = -sin(PI/4) * 10
					
				get_tree().get_root().add_child(shot1)
			queue_free()