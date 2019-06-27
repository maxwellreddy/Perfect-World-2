extends RigidBody2D

var x = get_pos().x
var y = get_pos().y

const enemy_shot_1 = preload("res://Level Scene/Enemy Bullet 1.tscn")
const enemy_shot_2 = preload("res://Level Scene/Enemy Bullet 2.tscn")
const enemy_shot_3 = preload("res://Level Scene/Enemy Bullet 3.tscn")
const enemy_shot_4 = preload("res://Level Scene/Enemy Bullet 4.tscn")
const enemy_shot_6 = preload("res://Level Scene/Enemy Bullet 6.tscn")
const enemy_shot_7 = preload("res://Level Scene/Enemy Bullet 7.tscn")
const enemy_shot_8 = preload("res://Level Scene/Enemy Bullet 8.tscn")
const enemy_shot_9 = preload("res://Level Scene/Enemy Bullet 9.tscn")
const enemy_shot_10 = preload("res://Level Scene/Enemy Bullet 10.tscn")
const enemy_shot_11 = preload("res://Level Scene/Enemy Bullet 11.tscn")
const enemy_shot_12 = preload("res://Level Scene/Enemy Bullet 12.tscn")
const enemy_shot_13 = preload("res://Level Scene/Enemy Bullet 13.tscn")
const enemy_shot_14 = preload("res://Level Scene/Enemy Bullet 14.tscn")
const enemy_shot_15 = preload("res://Level Scene/Enemy Bullet 15.tscn")
const enemy_shot_16 = preload("res://Level Scene/Enemy Bullet 16.tscn")
const enemy_shot_19 = preload("res://Level Scene/Enemy Bullet 19.tscn")
const enemy_shot_20 = preload("res://Level Scene/Enemy Bullet 20.tscn")
const enemy_shot_21 = preload("res://Level Scene/Enemy Bullet 21.tscn")
const enemy_shot_22 = preload("res://Level Scene/Enemy Bullet 22.tscn")
const enemy_shot_23 = preload("res://Level Scene/Enemy Bullet 23.tscn")
const enemy_shot_24 = preload("res://Level Scene/Enemy Bullet 24.tscn")
const enemy_shot_25 = preload("res://Level Scene/Enemy Bullet 25.tscn")
const enemy_shot_26 = preload("res://Level Scene/Enemy Bullet 26.tscn")
const marker_1 = preload("res://Level Scene/Marker 1.tscn")
const victory = preload("res://Level Scene/Victory.tscn")

const nonspell_2_left_familiar = preload("res://Level Scene/Nonspell 2 Left Familiar.tscn")
const nonspell_2_right_familiar = preload("res://Level Scene/Nonspell 2 Right Familiar.tscn")
const spell_2_left_familiar = preload("res://Level Scene/Spell 2 Left Familiar.tscn")

const life_bar_spawn = preload("res://Level Scene/Life Bar.tscn")

var intro = 1
var nonspell_1 = 0
var spell_1 = 0
var nonspell_2 = 0
var spell_2 = 0
var nonspell_3 = 0
var spell_3 = 0
var spell_4 = 0
var spell_5 = 0
var spell_6 = 0

var hp_ns1 = 1200.0
var hp_s1 = 850.0
var hp_ns2 = 1400.0
var hp_s2 = 1100.0
var hp_ns3 = 1500.0
var hp_s3 = 1400.0
var hp_s4 = 1200.0
var hp_s5 = 4100.0
var hp_s6 = 1000.0

var new_x = 0
var new_y = 0
var new_x_pos_diff = 0
var new_y_pos_diff = 0
var timer = 0
var timer2 = 0
var timer3 = 0
var timer4 = 0
var move_timer = 50
var unload_timer = 0
var inv_timer = 0
var dialogue = true
var life_bar_created = false
var life_bar = 0

var fake_player_x = 0
var fake_player_y = 0
var fake_player_x2 = 0
var fake_player_y2 = 0
var fake_player_x3 = 0
var fake_player_y3 = 0
var fake_player_x4 = 0
var fake_player_y4 = 0

var spell_4_n = 0
var spell_4_x = 0
var spell_4_y = 0
var spell_4_n2 = 0
var spell_4_x2 = 0
var spell_4_y2 = 0

#Bullet Variables
var resolve = 0
var angle = 0
var x_move = 0
var y_move = 0
var id = 0

func _ready():
	set_fixed_process(true)

func corner_barrage(enemy_shot, fake_player_x, fake_player_y, set_x, set_y):
	for i in range(0, 7):
		var shot1 = enemy_shot.instance()
		shot1.set_pos(Vector2(set_x, set_y))
		resolve = fake_player_x - set_x
		x_move = fake_player_x - set_x
		y_move = fake_player_y - set_y
		if x_move < 0:
			angle = atan(y_move/x_move) + PI + (i * PI / 7)
		else:
			angle = atan(y_move/x_move) + (i * PI / 7)
		x_move = y_move * tan(angle)
			
		var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
		var displacement = pow(hypotenuse, 0.5)
		var n = displacement / 1
					
		shot1.x = x_move / n
		shot1.y = y_move / n
			
		get_tree().get_root().add_child(shot1)
		############################################
		var shot1 = enemy_shot.instance()
		shot1.set_pos(Vector2(set_x, set_y))
		resolve = fake_player_x - set_x
		x_move = fake_player_x - set_x
		y_move = fake_player_y - set_y
		if x_move < 0:
			angle = atan(y_move/x_move) + PI + (i * PI / 7)
		else:
			angle = atan(y_move/x_move) + (i * PI / 7)
		x_move = y_move * tan(angle)
			
		var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
		var displacement = pow(hypotenuse, 0.5)
		var n = displacement / 1
					
		shot1.x = -x_move / n
		shot1.y = -y_move / n
			
		get_tree().get_root().add_child(shot1)
		
func _fixed_process(delta):
	timer += 1
	timer2 += 1
	timer3 += 1
	timer4 += 1
	move_timer += 1
	if intro == 1:
		unload_timer += 1
		if unload_timer < 25:
			set_pos(Vector2(340, get_pos().y + 5))
		if unload_timer >= 25 and unload_timer < 50:
			set_pos(Vector2(340, get_pos().y + 5 - (0.2 * (unload_timer - 25))))
		if unload_timer >= 50:
			set_pos(Vector2(340, get_pos().y))
			nonspell_1 = 1
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			move_timer = 0
			intro = 2
	
	elif nonspell_1 == 1:
		if timer4 == 40:
			get_child(2).play("se_ch02")
		
		if timer4 >= 40 and timer4 <= 80:
			get_child(0).hide()
			get_child(5).show()
		
		if life_bar_created == false:
			life_bar = life_bar_spawn.instance()
			life_bar.set_pos(Vector2(40, 40))
			life_bar.hp = hp_ns1
			life_bar.max_hp = 1200.0
			get_tree().get_root().add_child(life_bar)
			life_bar_created = true
		if move_timer >= 0 and move_timer < 239:
			new_x_pos_diff = 0
			new_y_pos_diff = 0
		if move_timer == 239:
			if get_parent().get_child(0).get_child(0).get_pos().x < get_pos().x:
				new_x = get_pos().x + rand_range(-100, 0)
				new_y = get_pos().y + rand_range(-100, 100)
			else:
				new_x = get_pos().x + rand_range(0, 100)
				new_y = get_pos().y + rand_range(-100, 100)

		if move_timer >= 240 and move_timer < 280:
			new_x_pos_diff = new_x - get_pos().x
			new_y_pos_diff = new_y - get_pos().y
			var hypotenuse_pos = pow(new_x_pos_diff, 2) + pow(new_y_pos_diff, 2)
			var displacement_pos = pow(hypotenuse_pos, 0.5)
			var n = displacement_pos / 4
		
			new_x_pos_diff = new_x_pos_diff / n
			new_y_pos_diff = new_y_pos_diff / n
			set_pos(Vector2(get_pos().x + new_x_pos_diff, get_pos().y + new_y_pos_diff))
			if get_pos().x <= 90:
				set_pos(Vector2(90, get_pos().y))

			if get_pos().x >= 590:
				set_pos(Vector2(590, get_pos().y))

			if get_pos().y <= 120:
				set_pos(Vector2(get_pos().x, 120))

			if get_pos().y >= 200:
				set_pos(Vector2(get_pos().x, 200))
			
			if new_x_pos_diff <= 0:
				if get_pos().x < new_x:
					new_x_pos_diff = 0
					move_timer = 140
			elif new_x_pos_diff > 0:
				if get_pos().x > new_x:
					new_x_pos_diff = 0
					move_timer = 140
			if new_y_pos_diff < 0:
				if get_pos().y < new_y:
					new_y_pos_diff = 0
					move_timer = 140
			elif new_y_pos_diff > 0:
				if get_pos().y > new_y:
					new_y_pos_diff = 0
					move_timer = 140
		
		if move_timer >= 280:
			new_x_pos_diff = 0
			new_y_pos_diff = 0
			move_timer = 0
		####################################
		if timer == 100:
			get_child(2).play("se_enep02")
			var left_spawn_x = 340 + rand_range(-250, -200)
			var left_spawn_y = get_parent().get_child(0).get_child(0).get_pos().y + rand_range(-75, 75)
			for i in range(0, 10):
				var shot1 = enemy_shot_1.instance()
				shot1.set_pos(Vector2(left_spawn_x, left_spawn_y))
				x_move = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
				y_move = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 10)
				else:
					angle = atan(y_move/x_move) + (i * PI / 10)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				
				
				var n = displacement / 1
							
				shot1.x = x_move / n
				shot1.y = y_move / n
						
				get_tree().get_root().add_child(shot1)
				############################################
				var shot1 = enemy_shot_1.instance()
				shot1.set_pos(Vector2(left_spawn_x, left_spawn_y))
				x_move = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
				y_move = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 10)
				else:
					angle = atan(y_move/x_move) + (i * PI / 10)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
					
				var n = displacement / 1
							
				shot1.x = -x_move / n
				shot1.y = -y_move / n
						
				get_tree().get_root().add_child(shot1)
			###############################################
			var left_spawn_x = 340 + rand_range(250, 200)
			var left_spawn_y = get_parent().get_child(0).get_child(0).get_pos().y + rand_range(-75, 75)
			for i in range(0, 20):
				var shot1 = enemy_shot_1.instance()
				shot1.set_pos(Vector2(left_spawn_x, left_spawn_y))
				x_move = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
				y_move = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 10)
				else:
					angle = atan(y_move/x_move) + (i * PI / 10)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
					
				var n = displacement / 1
							
				shot1.x = x_move / n
				shot1.y = y_move / n
						
				get_tree().get_root().add_child(shot1)
				############################################
				var shot1 = enemy_shot_1.instance()
				shot1.set_pos(Vector2(left_spawn_x, left_spawn_y))
				x_move = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
				y_move = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 10)
				else:
					angle = atan(y_move/x_move) + (i * PI / 10)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
					
				var n = displacement / 1
							
				shot1.x = -x_move / n
				shot1.y = -y_move / n
						
				get_tree().get_root().add_child(shot1)
			timer = 0
		####################################################
		if timer2 >= 80 and timer2 <= 100:
			get_child(0).hide()
			get_child(5).show()
		else:
			get_child(5).hide()
			get_child(0).show()
		if timer2 == 200:

			for j in range (-2, 3):
				for i in range(0, 4):
					var shot2 = enemy_shot_2.instance()
					shot2.id = i
					shot2.set_pos(get_pos())
					x_move = (get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x)
					y_move = (get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y)
					var angle2 = atan(x_move/y_move) + (j * PI / 6)
						
					var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
					var displacement = pow(hypotenuse, 0.5)
					if x_move < 0 and y_move < 0:
						x_move = -(displacement * sin(angle2))
						y_move = -(displacement * cos(angle2))
					elif x_move < 0 and y_move >= 0:
						x_move = displacement * sin(angle2)
						y_move = (displacement * cos(angle2))
					elif x_move >= 0 and y_move < 0:
						x_move = -displacement * sin(angle2)
						y_move = -(displacement * cos(angle2))
					elif x_move >= 0 and y_move >= 0:
						x_move = displacement * sin(angle2)
						y_move = (displacement * cos(angle2))
					
					angle = atan(x_move/y_move) + (PI / 2)
					hypotenuse = pow(x_move, 2) + pow(y_move, 2)
					displacement = pow(hypotenuse, 0.5)
					var x_move2 = y_move * tan(angle)

					var n = displacement / 2
					var hypotenuse2 = pow(x_move2, 2) + pow(y_move, 2)
					var displacement2 = pow(hypotenuse2, 0.5)
					var n2 = displacement2 / 5
						
					if y_move > 0:
						shot2.set_rot(atan(x_move/y_move))
					elif y_move < 0:
						if x_move > 0:
							shot2.set_rot(acos(y_move/displacement))
						elif x_move < 0:
							shot2.set_rot(atan(x_move/y_move) + PI)
						else:
							shot2.set_rot(PI)
					else:
						if x_move > 0:
							shot2.set_rot(PI/2)
						elif x_move < 0:
							shot2.set_rot((PI * 3) / 2)
								
					if y_move != 0:
						if angle <= (PI / 2):
							shot2.set_pos(Vector2(get_pos().x + (i * 5 * (-(x_move2 / n2))), get_pos().y + (i * 5 * (-(y_move / n2)))))
						else:
							shot2.set_pos(Vector2(get_pos().x + (i * 5 * (x_move2 / n2)), get_pos().y + (i * 5 * (y_move / n2))))
					else:
						if resolve > 0:
							shot2.set_pos(Vector2(get_pos().x + -(cos(PI/4) * 5) , get_pos().y + (-(sin(PI/4) * 5))))
						elif resolve <= 0:
							shot2.set_pos(Vector2(get_pos().x + ((cos(PI/4) * 5)) , get_pos().y + (sin(PI/4) * 5)))
							
					shot2.x = x_move / n
					shot2.y = y_move / n
							
					get_tree().get_root().add_child(shot2)
					#############################################
					var shot2 = enemy_shot_2.instance()
					shot2.id = i
					shot2.set_pos(get_pos())
					resolve = (get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x)
					x_move = (get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x)
					y_move = (get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y)
					var angle2 = atan(x_move/y_move) + (j * PI / 6)
					var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
					var displacement = pow(hypotenuse, 0.5)
					
					if x_move < 0 and y_move < 0:
						x_move = -(displacement * sin(angle2))
						y_move = -(displacement * cos(angle2))
					elif x_move < 0 and y_move >= 0:
						x_move = displacement * sin(angle2)
						y_move = (displacement * cos(angle2))
					elif x_move >= 0 and y_move < 0:
						x_move = -displacement * sin(angle2)
						y_move = -(displacement * cos(angle2))
					elif x_move >= 0 and y_move >= 0:
						x_move = displacement * sin(angle2)
						y_move = (displacement * cos(angle2))
					angle = atan(x_move/y_move) - (PI / 2)
					hypotenuse = pow(x_move, 2) + pow(y_move, 2)
					displacement = pow(hypotenuse, 0.5)
					var x_move2 = y_move * tan(angle)
					var n = displacement / 2
					
					var hypotenuse2 = pow(x_move2, 2) + pow(y_move, 2)
					var displacement2 = pow(hypotenuse2, 0.5)
					var n2 = displacement2 / 5
						
					if y_move > 0:
						shot2.set_rot(atan(x_move/y_move))
					elif y_move < 0:
						if x_move > 0:
							shot2.set_rot(acos(y_move/displacement))
						elif x_move < 0:
							shot2.set_rot(atan(x_move/y_move) + PI)
						else:
							shot2.set_rot(PI)
					else:
						if x_move > 0:
							shot2.set_rot(PI/2)
						elif x_move < 0:
							shot2.set_rot((PI * 3) / 2)
								
					if y_move != 0:
						if angle < (-PI / 2):
							shot2.set_pos(Vector2(get_pos().x + (i * 5 * (x_move2 / n2)), get_pos().y + (i * 5 * (y_move / n2))))
						else:
							shot2.set_pos(Vector2(get_pos().x + (i * 5 * -(x_move2 / n2)), get_pos().y + (i * 5 * -(y_move / n2))))
						
					else:
						if resolve > 0:
							shot2.set_pos(Vector2(get_pos().x + -(cos(PI/4) * 5) , get_pos().y + (-(sin(PI/4) * 5))))
						elif resolve <= 0:
							shot2.set_pos(Vector2(get_pos().x + ((cos(PI/4) * 5)) , get_pos().y + (sin(PI/4) * 5)))
							
					shot2.x = x_move / n
					shot2.y = y_move / n
					get_tree().get_root().add_child(shot2)
			timer2 = 80
		for bodies in get_colliding_bodies():
			if bodies.is_in_group("player shot"):
				hp_ns1 -= 3
				bodies.queue_free()
			if bodies.is_in_group("player shot 2"):
				hp_ns1 -= 2
				bodies.queue_free()
			if bodies.is_in_group("player shot 3"):
				hp_ns1 -= 1
				bodies.queue_free()
			life_bar.hp = hp_ns1
		if hp_ns1 <= 0:
			nonspell_1 = 2
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 1
			new_y_pos_diff = 1
			move_timer = 98
			get_child(2).play("se_enep00")
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()

	elif spell_1 == 0:
		life_bar_created = false
		var done_move = false
		if move_timer == 99:
			new_x = 340
			new_y = 360
		if move_timer >= 100:
			
			new_x_pos_diff = new_x - get_pos().x
			new_y_pos_diff = new_y - get_pos().y
					
			var hypotenuse_pos = pow(new_x_pos_diff, 2) + pow(new_y_pos_diff, 2)
			var displacement_pos = pow(hypotenuse_pos, 0.5)
			var n = displacement_pos / 6
			
			new_x_pos_diff = new_x_pos_diff / n
			new_y_pos_diff = new_y_pos_diff / n
			set_pos(Vector2(get_pos().x + new_x_pos_diff, get_pos().y + new_y_pos_diff))
			if new_x_pos_diff <= 0:
				if get_pos().x < new_x:
					done_move = true
			elif new_x_pos_diff > 0:
				if get_pos().x > new_x:
					done_move = true
			if new_y_pos_diff < 0:
				if get_pos().y < new_y:
					done_move = true
			elif new_y_pos_diff > 0:
				if get_pos().y > new_y:
					done_move = true
						
		if done_move == true:
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			spell_1 = 1
	
	elif spell_1 == 1:
		if life_bar_created == false:
			life_bar = life_bar_spawn.instance()
			life_bar.set_pos(Vector2(40, 40))
			life_bar.hp = hp_s1
			life_bar.max_hp = 850.0
			get_tree().get_root().add_child(life_bar)
			life_bar_created = true
		set_pos(Vector2(340, 360))
		if timer4 == 40:
			get_child(2).play("se_ch02")
		if timer4 >= 40 and timer4 <= 80:
			get_child(0).hide()
			get_child(5).show()
		if timer == 100:
			fake_player_x = rand_range(get_pos().x - 10, get_pos().y + 11)
			fake_player_y = rand_range(get_pos().x - 10, get_pos().y + 11)
		if timer >= 100 and timer <= 240:
			get_child(0).hide()
			get_child(5).show()
		else:
			get_child(5).hide()
			get_child(0).show()
		if timer >= 100 and timer <= 118 and timer % 3 == 1:
			get_child(2).play("se_tan02")
			for i in range(0, 6):
				var shot1 = enemy_shot_3.instance()
				shot1.set_pos(get_pos())
				x_move = fake_player_x - get_pos().x
				y_move = fake_player_y - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 4) + (((timer - 100)) * (PI / 120))
				else:
					angle = atan(y_move/x_move) + (i * PI / 4) + (((timer - 100)) * (PI / 120))
				while (angle > 2 * PI):
					angle -= (2 * PI)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				
				var n = displacement / 4
							
				shot1.x = x_move / n
				shot1.y = y_move / n
				get_tree().get_root().add_child(shot1)
				
				####################################################
				
				var shot1 = enemy_shot_3.instance()
				shot1.set_pos(get_pos())
				x_move = fake_player_x - get_pos().x
				y_move = fake_player_y - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 4) + (((timer - 100)) * (PI / 120))
				else:
					angle = atan(y_move/x_move) + (i * PI / 4) + (((timer - 100)) * (PI / 120))
				while (angle > 2 * PI):
					angle -= (2 * PI)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				
				var n = displacement / 4
							
				shot1.x = -x_move / n
				shot1.y = -y_move / n
				get_tree().get_root().add_child(shot1)
				
			#############################################################
		if timer == 200:
			fake_player_x = rand_range(get_pos().x - 10, get_pos().x + 11)
			fake_player_y = rand_range(get_pos().y - 10, get_pos().y + 11)
		if timer >= 215 and timer <= 233 and timer % 3 == 0:
			get_child(2).play("se_tan02")
			for i in range(0, 6):
				var shot1 = enemy_shot_4.instance()
				shot1.set_pos(get_pos())
				x_move = fake_player_x - get_pos().x
				y_move = fake_player_y - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 4) - (((timer - 180)) * (PI / 120))
				else:
					angle = atan(y_move/x_move) + (i * PI / 4) - (((timer - 180)) * (PI / 120))
				while (angle > 2 * PI):
					angle -= (2 * PI)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				
				var n = displacement / 4
							
				shot1.x = x_move / n
				shot1.y = y_move / n
				get_tree().get_root().add_child(shot1)
				
				####################################################
				
				var shot1 = enemy_shot_4.instance()
				shot1.set_pos(get_pos())
				x_move = fake_player_x - get_pos().x
				y_move = fake_player_y - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 4) - (((timer - 180)) * (PI / 120))
				else:
					angle = atan(y_move/x_move) + (i * PI / 4) - (((timer - 180)) * (PI / 120))
				while (angle > 2 * PI):
					angle -= (2 * PI)
				x_move = y_move * tan(angle)
					
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				
				var n = displacement / 4
							
				shot1.x = -x_move / n
				shot1.y = -y_move / n
				get_tree().get_root().add_child(shot1)
				
		if timer == 325:
			timer = 70
		for bodies in get_colliding_bodies():
			if bodies.is_in_group("player shot"):
				hp_s1 -= 3
				bodies.queue_free()
			if bodies.is_in_group("player shot 2"):
				hp_s1 -= 2
				bodies.queue_free()
			if bodies.is_in_group("player shot 3"):
				hp_s1 -= 1
				bodies.queue_free()
			life_bar.hp = hp_s1
		if hp_s1 <= 0:
			spell_1 = 2
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 0
			new_y_pos_diff = 0
			move_timer = 98
			get_child(2).play("se_enep00")
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()
					
	elif nonspell_2 == 0:
		for bodies in get_parent().get_children():
			if bodies.is_in_group("remove"):
				bodies.queue_free()
		life_bar_created = false
		var done_move = false
		if move_timer == 99:
			new_x = 340
			new_y = 185
		if move_timer >= 100:
			
			new_x_pos_diff = new_x - get_pos().x
			new_y_pos_diff = new_y - get_pos().y
					
			var hypotenuse_pos = pow(new_x_pos_diff, 2) + pow(new_y_pos_diff, 2)
			var displacement_pos = pow(hypotenuse_pos, 0.5)
			var n = displacement_pos / 6
			
			new_x_pos_diff = new_x_pos_diff / n
			new_y_pos_diff = new_y_pos_diff / n
			set_pos(Vector2(get_pos().x + new_x_pos_diff, get_pos().y + new_y_pos_diff))
			if new_x_pos_diff <= 0:
				if get_pos().x < new_x:
					done_move = true
			elif new_x_pos_diff > 0:
				if get_pos().x > new_x:
					done_move = true
			if new_y_pos_diff < 0:
				if get_pos().y < new_y:
					done_move = true
			elif new_y_pos_diff > 0:
				if get_pos().y > new_y:
					done_move = true
						
		if done_move == true:
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			nonspell_2 = 1
			
	elif nonspell_2 == 1:
		if life_bar_created == false:
			life_bar = life_bar_spawn.instance()
			life_bar.set_pos(Vector2(40, 40))
			life_bar.hp = hp_ns2
			life_bar.max_hp = 1400.0
			get_tree().get_root().add_child(life_bar)
			life_bar_created = true
		set_pos(Vector2(340, 185))
		if timer4 == 40:
			get_child(2).play("se_ch02")
		if timer4 >= 40:
			get_child(0).hide()
			get_child(5).show()
		if timer == 100:
			var left_familiar = nonspell_2_left_familiar.instance()
			left_familiar.set_pos(left_familiar.get_pos())
			get_tree().get_root().add_child(left_familiar)
			var right_familiar = nonspell_2_right_familiar.instance()
			right_familiar.set_pos(right_familiar.get_pos())
			get_tree().get_root().add_child(right_familiar)
			
		if timer2 >= 109 and timer2 <= 153 and timer2 % 4 == 1:
			get_child(2).play("se_tan00")
			var shot2 = enemy_shot_13.instance()
			x_move = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
			y_move = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
			if x_move < 0:
				angle = atan(y_move/x_move) + PI
			else:
				angle = atan(y_move/x_move)
				
			var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
			var displacement = pow(hypotenuse, 0.5)
			var n = displacement / (((timer2 - 100) / 5))
				
			if y_move > 0:
				shot2.set_rot(atan(x_move/y_move))
			elif y_move < 0:
				shot2.set_rot(atan(x_move/y_move) + PI)
						
			shot2.x = x_move / n
			shot2.y = y_move / n
						
			shot2.set_pos(get_pos())
			get_tree().get_root().add_child(shot2)
		if timer2 == 154:
			timer2 = 90
			
		for bodies in get_colliding_bodies():
			if bodies.is_in_group("player shot"):
				hp_ns2 -= 3
				bodies.queue_free()
			if bodies.is_in_group("player shot 2"):
				hp_ns2 -= 2
				bodies.queue_free()
			if bodies.is_in_group("player shot 3"):
				hp_ns2 -= 1
				bodies.queue_free()
			life_bar.hp = hp_ns2
		if hp_ns2 <= 0:
			nonspell_2 = 2
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			move_timer = 98
			get_child(2).play("se_enep00")
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()
	elif spell_2 == 0:
		life_bar_created = false
		for bodies in get_parent().get_children():
			if bodies.is_in_group("remove"):
				bodies.queue_free()
		spell_2 = 1
		
	elif spell_2 == 1:
		if life_bar_created == false:
			life_bar = life_bar_spawn.instance()
			life_bar.set_pos(Vector2(40, 40))
			life_bar.hp = hp_s2
			life_bar.max_hp = 1100.0
			get_tree().get_root().add_child(life_bar)
			life_bar_created = true
		set_pos(Vector2(340, 185))
		if timer4 == 40:
			get_child(2).play("se_ch02")
		if timer4 >= 40 and timer4 <= 180:
			get_child(0).hide()
			get_child(5).show()

		if timer == 100:
			for i in range(0, 15):
				var left_familiar = spell_2_left_familiar.instance()
				left_familiar.y = 450 - (i * 30)
				left_familiar.set_pos(left_familiar.get_pos())
				get_tree().get_root().add_child(left_familiar)
			for i in range(0, 3):
				var left_familiar = spell_2_left_familiar.instance()
				left_familiar.y = 600 + (i * 30)
				left_familiar.set_pos(left_familiar.get_pos())
				get_tree().get_root().add_child(left_familiar)
		if timer2 >= 0 and timer2 <= 20:
			get_child(0).hide()
			get_child(5).show()
		else:
			get_child(5).hide()
			get_child(0).show()
		if timer2 == 210:
			get_child(2).play("se_boon01")
			var shot7 = enemy_shot_7.instance()
			shot7.set_pos(Vector2(get_parent().get_child(0).get_child(0).get_pos().x, 0))
			get_tree().get_root().add_child(shot7)
			timer2 = 0
		if timer3 == 100:
			var rand_pos = rand_range(-50, 50)
			for i in range(0, 51):
				var shot8 = enemy_shot_8.instance()
				shot8.x = -2
				shot8.y = 2
				shot8.set_pos(Vector2(1350 + rand_pos - (i * 90), shot8.get_pos().y))
				get_tree().get_root().add_child(shot8)
			timer3 = 50
		for bodies in get_colliding_bodies():
			if bodies.is_in_group("player shot"):
				hp_s2 -= 3
				bodies.queue_free()
			if bodies.is_in_group("player shot 2"):
				hp_s2 -= 2
				bodies.queue_free()
			if bodies.is_in_group("player shot 3"):
				hp_s2 -= 1
				bodies.queue_free()
			life_bar.hp = hp_s2
		if hp_s2 <= 0:
			spell_2 = 2
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			move_timer = 98
			get_child(2).play("se_enep00")
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()
					
	elif nonspell_3 == 0:
		life_bar_created = false
		for bodies in get_parent().get_children():
			if bodies.is_in_group("remove"):
				bodies.queue_free()
		nonspell_3 = 1
		
	elif nonspell_3 == 1:
		if timer4 >= 40:
			get_child(0).hide()
			get_child(5).show()
		if life_bar_created == false:
			life_bar = life_bar_spawn.instance()
			life_bar.set_pos(Vector2(40, 40))
			life_bar.hp = hp_ns3
			life_bar.max_hp = 1500.0
			get_tree().get_root().add_child(life_bar)
			life_bar_created = true
		if move_timer >= 0 and move_timer < 239:
			new_x_pos_diff = 0
			new_y_pos_diff = 0
		if move_timer == 239:
			if get_parent().get_child(0).get_child(0).get_pos().x < get_pos().x:
				new_x = get_pos().x + rand_range(-100, 0)
				new_y = get_pos().y + rand_range(-100, 100)
			else:
				new_x = get_pos().x + rand_range(0, 100)
				new_y = get_pos().y + rand_range(-100, 100)

		if move_timer >= 240 and move_timer < 280:
			new_x_pos_diff = new_x - get_pos().x
			new_y_pos_diff = new_y - get_pos().y
			var hypotenuse_pos = pow(new_x_pos_diff, 2) + pow(new_y_pos_diff, 2)
			var displacement_pos = pow(hypotenuse_pos, 0.5)
			var n = displacement_pos / 4
		
			new_x_pos_diff = new_x_pos_diff / n
			new_y_pos_diff = new_y_pos_diff / n
			set_pos(Vector2(get_pos().x + new_x_pos_diff, get_pos().y + new_y_pos_diff))
			if get_pos().x <= 90:
				set_pos(Vector2(90, get_pos().y))

			if get_pos().x >= 590:
				set_pos(Vector2(590, get_pos().y))

			if get_pos().y <= 120:
				set_pos(Vector2(get_pos().x, 120))

			if get_pos().y >= 200:
				set_pos(Vector2(get_pos().x, 200))
			
			if new_x_pos_diff <= 0:
				if get_pos().x < new_x:
					new_x_pos_diff = 0
					move_timer = 140
			elif new_x_pos_diff > 0:
				if get_pos().x > new_x:
					new_x_pos_diff = 0
					move_timer = 140
			if new_y_pos_diff < 0:
				if get_pos().y < new_y:
					new_y_pos_diff = 0
					move_timer = 140
			elif new_y_pos_diff > 0:
				if get_pos().y > new_y:
					new_y_pos_diff = 0
					move_timer = 140
		
		if move_timer >= 280:
			new_x_pos_diff = 0
			new_y_pos_diff = 0
			move_timer = 0
			
		if timer4 == 40:
			get_child(2).play("se_ch02")
		if timer == 100:
			fake_player_x = rand_range(40, 640)
			fake_player_y = rand_range(60, 660)
			fake_player_x2 = rand_range(40, 640)
			fake_player_y2 = rand_range(60, 660)
			fake_player_x3 = rand_range(40, 640)
			fake_player_y3 = rand_range(60, 660)
			fake_player_x4 = rand_range(40, 640)
			fake_player_y4 = rand_range(60, 660)
		
		if timer == 101:
			get_child(2).play("se_enep02")
			corner_barrage(enemy_shot_9, fake_player_x, fake_player_y, 40, 60)
			corner_barrage(enemy_shot_9, fake_player_x, fake_player_y, 640, 60)
			corner_barrage(enemy_shot_10, fake_player_x3, fake_player_y3, 40, 660)
			corner_barrage(enemy_shot_10, fake_player_x4, fake_player_y4, 640, 660)
		if timer == 181:
			get_child(2).play("se_enep02")
			corner_barrage(enemy_shot_11, fake_player_x, fake_player_y, 180, 200)
			corner_barrage(enemy_shot_11, fake_player_x, fake_player_y, 500, 200)
			corner_barrage(enemy_shot_12, fake_player_x3, fake_player_y3, 180, 520)
			corner_barrage(enemy_shot_12, fake_player_x4, fake_player_y4, 500, 520)
		if timer == 261:
			get_child(2).play("se_enep02")
			corner_barrage(enemy_shot_14, fake_player_x, fake_player_y, 320, 340)
			corner_barrage(enemy_shot_14, fake_player_x, fake_player_y, 360, 340)
			corner_barrage(enemy_shot_15, fake_player_x3, fake_player_y3, 320, 380)
			corner_barrage(enemy_shot_15, fake_player_x4, fake_player_y4, 360, 380)
		if timer == 341:
			get_child(2).play("se_enep02")
			corner_barrage(enemy_shot_11, fake_player_x, fake_player_y, 180, 200)
			corner_barrage(enemy_shot_11, fake_player_x, fake_player_y, 500, 200)
			corner_barrage(enemy_shot_12, fake_player_x3, fake_player_y3, 180, 520)
			corner_barrage(enemy_shot_12, fake_player_x4, fake_player_y4, 500, 520)
			timer = 21
		if timer2 >= 321 and (timer2 - 321 == 0 or (timer2 - 321) % 80 == 0):
			get_child(3).play("se_kira00")
			
		for bodies in get_colliding_bodies():
			if bodies.is_in_group("player shot"):
				hp_ns3 -= 3
				bodies.queue_free()
			if bodies.is_in_group("player shot 2"):
				hp_ns3 -= 2
				bodies.queue_free()
			if bodies.is_in_group("player shot 3"):
				hp_ns3 -= 1
				bodies.queue_free()
			life_bar.hp = hp_ns3
		if hp_ns3 <= 0:
			nonspell_3 = 2
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 1
			new_y_pos_diff = 1
			move_timer = 98
			get_child(2).play("se_enep00")
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()
			
	elif spell_3 == 0:
		life_bar_created = false
		var done_move = false
		if move_timer == 99:
			new_x = 340
			new_y = 185
		if move_timer >= 100:
			
			new_x_pos_diff = new_x - get_pos().x
			new_y_pos_diff = new_y - get_pos().y
					
			var hypotenuse_pos = pow(new_x_pos_diff, 2) + pow(new_y_pos_diff, 2)
			var displacement_pos = pow(hypotenuse_pos, 0.5)
			var n = displacement_pos / 6
			
			new_x_pos_diff = new_x_pos_diff / n
			new_y_pos_diff = new_y_pos_diff / n
			set_pos(Vector2(get_pos().x + new_x_pos_diff, get_pos().y + new_y_pos_diff))
			if new_x_pos_diff <= 0:
				if get_pos().x < new_x:
					done_move = true
			elif new_x_pos_diff > 0:
				if get_pos().x > new_x:
					done_move = true
			if new_y_pos_diff < 0:
				if get_pos().y < new_y:
					done_move = true
			elif new_y_pos_diff > 0:
				if get_pos().y > new_y:
					done_move = true
						
		if done_move == true:
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 0
			new_y_pos_diff = 0
			move_timer = 0
			spell_3 = 1
			
	elif spell_3 == 1:
		if life_bar_created == false:
			life_bar = life_bar_spawn.instance()
			life_bar.set_pos(Vector2(40, 40))
			life_bar.hp = hp_s3
			life_bar.max_hp = 1400.0
			get_tree().get_root().add_child(life_bar)
			life_bar_created = true
		if timer4 >= 40 and timer4 <= 80:
			get_child(0).hide()
			get_child(5).show()

		if timer4 == 40:
			get_child(2).play("se_ch02")
		if move_timer >= 0 and move_timer < 239:
			new_x_pos_diff = 0
			new_y_pos_diff = 0
		if move_timer == 239:
			if get_parent().get_child(0).get_child(0).get_pos().x < get_pos().x:
				new_x = get_pos().x + rand_range(-100, 0)
				new_y = get_pos().y + rand_range(-100, 100)
			else:
				new_x = get_pos().x + rand_range(0, 100)
				new_y = get_pos().y + rand_range(-100, 100)

		if move_timer >= 240 and move_timer < 280:
			new_x_pos_diff = new_x - get_pos().x
			new_y_pos_diff = new_y - get_pos().y
			var hypotenuse_pos = pow(new_x_pos_diff, 2) + pow(new_y_pos_diff, 2)
			var displacement_pos = pow(hypotenuse_pos, 0.5)
			var n = displacement_pos / 4
		
			new_x_pos_diff = new_x_pos_diff / n
			new_y_pos_diff = new_y_pos_diff / n
			set_pos(Vector2(get_pos().x + new_x_pos_diff, get_pos().y + new_y_pos_diff))
			if get_pos().x <= 90:
				set_pos(Vector2(90, get_pos().y))

			if get_pos().x >= 590:
				set_pos(Vector2(590, get_pos().y))

			if get_pos().y <= 120:
				set_pos(Vector2(get_pos().x, 120))

			if get_pos().y >= 200:
				set_pos(Vector2(get_pos().x, 200))
			
			if new_x_pos_diff <= 0:
				if get_pos().x < new_x:
					new_x_pos_diff = 0
					move_timer = 140
			elif new_x_pos_diff > 0:
				if get_pos().x > new_x:
					new_x_pos_diff = 0
					move_timer = 140
			if new_y_pos_diff < 0:
				if get_pos().y < new_y:
					new_y_pos_diff = 0
					move_timer = 140
			elif new_y_pos_diff > 0:
				if get_pos().y > new_y:
					new_y_pos_diff = 0
					move_timer = 140
		
		if move_timer >= 280:
			new_x_pos_diff = 0
			new_y_pos_diff = 0
			move_timer = 0
		if timer >= 0 and timer <= 20:
			get_child(0).hide()
			get_child(5).show()
		else:
			get_child(5).hide()
			get_child(0).show()
		if timer == 170:
			get_child(2).play("se_tan00")

			var marker = marker_1.instance()
			marker.set_pos(Vector2(get_parent().get_child(0).get_child(0).get_pos().x, get_parent().get_child(0).get_child(0).get_pos().y))
			marker.id = id
			get_tree().get_root().add_child(marker)
			######################################################
			var shot16 = enemy_shot_16.instance()
			shot16.set_pos(Vector2(get_pos().x, get_pos().y))
			shot16.id = id
			x_move = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
			y_move = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
			angle = atan(x_move/y_move)
			x_move = y_move * tan(angle)
			
			var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
			var displacement = pow(hypotenuse, 0.5)
			
			var n = 100
				
			if y_move > 0:
				shot16.set_rot(atan(x_move/y_move))
			elif y_move < 0:
				if x_move > 0:
					shot16.set_rot(acos(y_move/displacement))
				elif x_move < 0:
					shot16.set_rot(atan(x_move/y_move) + PI)
				else:
					shot16.set_rot(PI)
			else:
				if x_move > 0:
					shot16.set_rot(PI/2)
				elif x_move < 0:
					shot16.set_rot((PI * 3) / 2)
						
			if y_move != 0:
				if angle <= (PI / 2):
					shot16.x = (x_move / n)
					shot16.y = y_move / n
				else:
					shot16.x = -(x_move / n) 
					shot16.y = -(y_move / n)
			else:
				if resolve > 0:
					shot16.x = cos(PI/4) * 5
					shot16.y = -(sin(PI/4) * 5)
				elif resolve <= 0:
					shot16.x = -(cos(PI/4) * 5)
					shot16.y = sin(PI/4) * 5
					
			get_tree().get_root().add_child(shot16)
			id += 1
			if timer == 170:
				timer = 0
		for bodies in get_colliding_bodies():
			if bodies.is_in_group("player shot"):
				hp_s3 -= 3
				bodies.queue_free()
			if bodies.is_in_group("player shot 2"):
				hp_s3 -= 2
				bodies.queue_free()
			if bodies.is_in_group("player shot 3"):
				hp_s3 -= 1
				bodies.queue_free()
			life_bar.hp = hp_s3
		if hp_s3 <= 0:
			spell_3 = 2
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 1
			new_y_pos_diff = 1
			move_timer = 98
			get_child(2).play("se_enep00")
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()
				
	elif spell_4 == 0:
		life_bar_created = false
		var done_move = false
		if move_timer == 99:
			new_x = 340
			new_y = 185
		if move_timer >= 100:
			
			new_x_pos_diff = new_x - get_pos().x
			new_y_pos_diff = new_y - get_pos().y
					
			var hypotenuse_pos = pow(new_x_pos_diff, 2) + pow(new_y_pos_diff, 2)
			var displacement_pos = pow(hypotenuse_pos, 0.5)
			var n = displacement_pos / 6
			
			new_x_pos_diff = new_x_pos_diff / n
			new_y_pos_diff = new_y_pos_diff / n
			set_pos(Vector2(get_pos().x + new_x_pos_diff, get_pos().y + new_y_pos_diff))
			if new_x_pos_diff <= 0:
				if get_pos().x < new_x:
					done_move = true
			elif new_x_pos_diff > 0:
				if get_pos().x > new_x:
					done_move = true
			if new_y_pos_diff < 0:
				if get_pos().y < new_y:
					done_move = true
			elif new_y_pos_diff > 0:
				if get_pos().y > new_y:
					done_move = true
						
		if done_move == true:
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 0
			new_y_pos_diff = 0
			move_timer = 0
			spell_4 = 1
				
	elif spell_4 == 1:
		if timer >= 0:
			get_child(0).hide()
			get_child(5).show()
		if life_bar_created == false:
			life_bar = life_bar_spawn.instance()
			life_bar.set_pos(Vector2(40, 40))
			life_bar.hp = hp_s4
			life_bar.max_hp = 1200.0
			get_tree().get_root().add_child(life_bar)
			life_bar_created = true
		set_pos(Vector2(340, 185))
		if timer3 == 40:
			get_child(2).play("se_ch02")
		if timer == 240 or timer3 == 340:
			get_child(4).play("se_ch02")
		if timer >= 100:
			if timer == 100:
				var shot19 = enemy_shot_19.instance()
				shot19.set_pos(get_pos())
				spell_4_x = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
				spell_4_y = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
				if spell_4_x < 0:
					angle = atan(spell_4_y/spell_4_x) + PI
				else:
					angle = atan(spell_4_y/spell_4_x)
				var hypotenuse = pow(spell_4_x, 2) + pow(spell_4_y, 2)
				var displacement = pow(hypotenuse, 0.5)
				spell_4_n = displacement / 6
				shot19.x = spell_4_x / spell_4_n
				shot19.y = spell_4_y / spell_4_n
				if spell_4_y > 0:
					shot19.set_rot(atan(spell_4_x/spell_4_y))
				elif spell_4_y < 0:
					shot19.set_rot(atan(spell_4_x/spell_4_y) + PI)
				shot19.id = 0
				get_tree().get_root().add_child(shot19)
				
			elif timer > 100 and timer % 5 == 0:
				get_child(2).play("se_tan00")
				var shot19 = enemy_shot_19.instance()
				shot19.set_pos(get_pos())
				shot19.x = spell_4_x / spell_4_n
				shot19.y = spell_4_y / spell_4_n
				if spell_4_y > 0:
					shot19.set_rot(atan(spell_4_x/spell_4_y))
				elif spell_4_y < 0:
					shot19.set_rot(atan(spell_4_x/spell_4_y) + PI)
				shot19.id = 0
				get_tree().get_root().add_child(shot19)
			if timer2 % 10 == 0:
				for i in range(0, 3):
					var shot19 = enemy_shot_19.instance()
					shot19.set_pos(Vector2(rand_range(40, 640), rand_range(50, 660)))
					shot19.x = spell_4_x / spell_4_n
					shot19.y = spell_4_y / spell_4_n
					if spell_4_y > 0:
						shot19.set_rot(atan(spell_4_x/spell_4_y))
					elif spell_4_y < 0:
						shot19.set_rot(atan(spell_4_x/spell_4_y) + PI)
					shot19.id = 1
					shot19.set_opacity(0)
					get_tree().get_root().add_child(shot19)
			if timer == 300:
				timer = 99
		if timer3 >= 200:
			if timer3 == 200:
				var shot20 = enemy_shot_20.instance()
				shot20.set_pos(get_pos())
				spell_4_x2 = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
				spell_4_y2 = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
				if spell_4_x2 < 0:
					angle = atan(spell_4_y2/spell_4_x2) + PI
				else:
					angle = atan(spell_4_y2/spell_4_x2)
				var hypotenuse = pow(spell_4_x2, 2) + pow(spell_4_y2, 2)
				var displacement = pow(hypotenuse, 0.5)
				spell_4_n2 = displacement / 6
				shot20.x = spell_4_x2 / spell_4_n2
				shot20.y = spell_4_y2 / spell_4_n2
				if spell_4_y2 > 0:
					shot20.set_rot(atan(spell_4_x2/spell_4_y2))
				elif spell_4_y2 < 0:
					shot20.set_rot(atan(spell_4_x2/spell_4_y2) + PI)
				shot20.id = 0
				get_tree().get_root().add_child(shot20)
			elif timer3 > 200 and timer % 5 == 0:
				get_child(3).play("se_tan00")
				var shot20 = enemy_shot_20.instance()
				shot20.set_pos(get_pos())
				shot20.x = spell_4_x2 / spell_4_n2
				shot20.y = spell_4_y2 / spell_4_n2
				if spell_4_y2 > 0:
					shot20.set_rot(atan(spell_4_x2/spell_4_y2))
				elif spell_4_y2 < 0:
					shot20.set_rot(atan(spell_4_x2/spell_4_y2) + PI)
				shot20.id = 0
				get_tree().get_root().add_child(shot20)
			if timer4 % 10 == 0:
				for i in range(0, 3):
					var shot20 = enemy_shot_20.instance()
					shot20.set_pos(Vector2(rand_range(40, 640), rand_range(50, 660)))
					shot20.x = spell_4_x2 / spell_4_n2
					shot20.y = spell_4_y2 / spell_4_n2
					if spell_4_y2 > 0:
						shot20.set_rot(atan(spell_4_x2/spell_4_y2))
					elif spell_4_y < 0:
						shot20.set_rot(atan(spell_4_x2/spell_4_y2) + PI)
					shot20.id = 1
					shot20.set_opacity(0)
					get_tree().get_root().add_child(shot20)
			if timer3 == 400:
				timer3 = 199

		for bodies in get_colliding_bodies():
			if bodies.is_in_group("player shot"):
				hp_s4 -= 3
				bodies.queue_free()
			if bodies.is_in_group("player shot 2"):
				hp_s4 -= 2
				bodies.queue_free()
			if bodies.is_in_group("player shot 3"):
				hp_s4 -= 1
				bodies.queue_free()
			life_bar.hp = hp_s4
		if hp_s4 <= 0:
			spell_4 = 2
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 1
			new_y_pos_diff = 1
			move_timer = 98
			get_child(2).play("se_enep00")
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()
	
	elif spell_5 == 0:
		life_bar_created = false
		var done_move = false
		if move_timer == 99:
			new_x = 340
			new_y = 360
		if move_timer >= 100:
			
			new_x_pos_diff = new_x - get_pos().x
			new_y_pos_diff = new_y - get_pos().y
					
			var hypotenuse_pos = pow(new_x_pos_diff, 2) + pow(new_y_pos_diff, 2)
			var displacement_pos = pow(hypotenuse_pos, 0.5)
			var n = displacement_pos / 6
			
			new_x_pos_diff = new_x_pos_diff / n
			new_y_pos_diff = new_y_pos_diff / n
			set_pos(Vector2(get_pos().x + new_x_pos_diff, get_pos().y + new_y_pos_diff))
			if new_x_pos_diff <= 0:
				if get_pos().x < new_x:
					done_move = true
			elif new_x_pos_diff > 0:
				if get_pos().x > new_x:
					done_move = true
			if new_y_pos_diff < 0:
				if get_pos().y < new_y:
					done_move = true
			elif new_y_pos_diff > 0:
				if get_pos().y > new_y:
					done_move = true
						
		if done_move == true:
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 0
			new_y_pos_diff = 0
			move_timer = 0
			spell_5 = 1
		
	elif spell_5 == 1:
		if life_bar_created == false:
			life_bar = life_bar_spawn.instance()
			life_bar.set_pos(Vector2(40, 40))
			life_bar.hp = hp_s5
			life_bar.max_hp = 4100.0
			get_tree().get_root().add_child(life_bar)
			life_bar_created = true
		if timer4 == 40:
			get_child(2).play("se_ch02")
		set_pos(Vector2(340, 360))
		set_opacity(0.5)
		
		life_bar.hp -= 1.0
		if (timer2 >= 100 and timer2 <= 120) or (timer2 >= 1100 and timer2 <= 1120) or (timer2 >= 2100 and timer2 <= 2120) or (timer >= 3100):
			get_child(0).hide()
			get_child(5).show()
		else:
			get_child(5).hide()
			get_child(0).show()
		if timer == 100:
			get_child(2).play("se_enep02")
			for i in range(0, 16):
				var shot21 = enemy_shot_21.instance()
				shot21.set_pos(get_pos())
				x_move = 0
				y_move = 1
				angle = (i * PI / 16)
				x_move = y_move * tan(angle)
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				var n = displacement / 2
				shot21.x = x_move / n
				shot21.y = y_move / n
				shot21.set_opacity(0.5)
				get_tree().get_root().add_child(shot21)
				#####################################################
				
				var shot21 = enemy_shot_21.instance()
				shot21.set_pos(get_pos())
				x_move = 0
				y_move = 1
				angle = (i * PI / 16)
				x_move = y_move * tan(angle)
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				var n = displacement / 2
				shot21.x = -x_move / n
				shot21.y = -y_move / n
				shot21.set_opacity(0.5)
				get_tree().get_root().add_child(shot21)
		if timer == 1100:
			get_child(2).play("se_enep02")
			for i in range(0, 12):
				var shot22 = enemy_shot_22.instance()
				shot22.set_pos(get_pos())
				x_move = 0
				y_move = 1
				angle = i * PI / 12
				x_move = y_move * tan(angle)
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				var n = displacement / 3.2
				shot22.x = x_move / n
				shot22.y = y_move / n
				shot22.set_opacity(0.5)
				get_tree().get_root().add_child(shot22)
				#####################################################
				var shot22 = enemy_shot_22.instance()
				shot22.set_pos(get_pos())
				x_move = 0
				y_move = 1
				angle = i * PI / 12
				x_move = y_move * tan(angle)
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				var n = displacement / 3.2
				shot22.x = -x_move / n
				shot22.y = -y_move / n
				shot22.set_opacity(0.5)
				get_tree().get_root().add_child(shot22)
		if timer == 2100:
			get_child(2).play("se_enep02")
			for i in range(0, 10):
				var shot23 = enemy_shot_23.instance()
				shot23.set_pos(get_pos())
				x_move = 0
				y_move = 1
				angle = i * PI / 10
				x_move = y_move * tan(angle)
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				var n = displacement / 1.5
				shot23.x = x_move / n
				shot23.y = y_move / n
				shot23.set_opacity(0.5)
				get_tree().get_root().add_child(shot23)
				#####################################################
				var shot23 = enemy_shot_23.instance()
				shot23.set_pos(get_pos())
				x_move = 0
				y_move = 1
				angle = i * PI / 10
				x_move = y_move * tan(angle)
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				var n = displacement / 1.5
				shot23.x = -x_move / n
				shot23.y = -y_move / n
				shot23.set_opacity(0.5)
				get_tree().get_root().add_child(shot23)

		if timer == 3100:
			get_child(2).play("se_enep02")
			for i in range(0, 10):
				var shot24 = enemy_shot_24.instance()
				shot24.set_pos(get_pos())
				x_move = 640 - get_pos().x
				y_move = 660 - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 10)
				else:
					angle = atan(y_move/x_move) + (i * PI / 10)
				x_move = y_move * tan(angle)
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				var n = displacement / 1.5
				shot24.x = x_move / n
				shot24.y = y_move / n
				shot24.set_opacity(0.5)
				get_tree().get_root().add_child(shot24)
				#####################################################
				
				var shot24 = enemy_shot_24.instance()
				shot24.set_pos(get_pos())
				x_move = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
				y_move = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
				if x_move < 0:
					angle = atan(y_move/x_move) + PI + (i * PI / 10)
				else:
					angle = atan(y_move/x_move) + (i * PI / 10)
				x_move = y_move * tan(angle)
				var hypotenuse = pow(x_move, 2) + pow(y_move, 2)
				var displacement = pow(hypotenuse, 0.5)
				var n = displacement / 1.5
				shot24.x = -x_move / n
				shot24.y = -y_move / n
				shot24.set_opacity(0.5)
				get_tree().get_root().add_child(shot24)
			timer = 2900
		if timer2 == 4100:
			spell_5 = 2
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 1
			new_y_pos_diff = 1
			move_timer = 98
			get_child(2).play("se_enep00")
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()
	elif spell_6 == 0:
		life_bar_created = false
		for bodies in get_parent().get_children():
			if bodies.is_in_group("remove"):
				bodies.queue_free()
		var done_move = false
		if move_timer == 99:
			new_x = 340
			new_y = 185
		if move_timer >= 100:
			
			new_x_pos_diff = new_x - get_pos().x
			new_y_pos_diff = new_y - get_pos().y
					
			var hypotenuse_pos = pow(new_x_pos_diff, 2) + pow(new_y_pos_diff, 2)
			var displacement_pos = pow(hypotenuse_pos, 0.5)
			var n = displacement_pos / 6
			
			new_x_pos_diff = new_x_pos_diff / n
			new_y_pos_diff = new_y_pos_diff / n
			set_pos(Vector2(get_pos().x + new_x_pos_diff, get_pos().y + new_y_pos_diff))
			if new_x_pos_diff <= 0:
				if get_pos().x < new_x:
					done_move = true
			elif new_x_pos_diff > 0:
				if get_pos().x > new_x:
					done_move = true
			if new_y_pos_diff < 0:
				if get_pos().y < new_y:
					done_move = true
			elif new_y_pos_diff > 0:
				if get_pos().y > new_y:
					done_move = true
						
		if done_move == true:
			timer = 0
			timer2 = 0
			timer3 = 0
			timer4 = 0
			new_x_pos_diff = 0
			new_y_pos_diff = 0
			move_timer = 0
			spell_6 = 1
			
	elif spell_6 == 1:
		if timer4 >= 40:
			get_child(0).hide()
			get_child(5).show()
		if life_bar_created == false:
			life_bar = life_bar_spawn.instance()
			life_bar.set_pos(Vector2(40, 40))
			life_bar.hp = hp_s6
			life_bar.max_hp = 1000.0
			get_tree().get_root().add_child(life_bar)
			life_bar_created = true
		if timer4 == 40:
			get_child(2).play("se_ch02")
		if timer == 100:
			get_child(2).play("se_tan00")
			var x_move = rand_range(40, 640) - get_pos().x
			var y_move = rand_range(60, 660) - get_pos().y
			for j in range(0, 3):
				for i in range(0, 12):
					var x_move2 = x_move
					var y_move2 = y_move
					var shot25 = enemy_shot_25.instance()
					shot25.set_pos(get_pos())
					if x_move2 < 0:
						angle = atan(y_move2/x_move2) + PI + (i * PI / 12)
					else:
						angle = atan(y_move2/x_move2) + (i * PI / 12)
					x_move2 = y_move2 * tan(angle)
					var hypotenuse = pow(x_move2, 2) + pow(y_move2, 2)
					var displacement = pow(hypotenuse, 0.5)
					var n = displacement / 1.5
					shot25.x = x_move2 / n
					shot25.y = y_move2 / n
					shot25.orig_x = get_pos().x
					shot25.orig_y = get_pos().y
					shot25.id = j + 1
					get_tree().get_root().add_child(shot25)
					#####################################################
					var x_move2 = x_move
					var y_move2 = y_move
					var shot25 = enemy_shot_25.instance()
					shot25.set_pos(get_pos())
					if x_move2 < 0:
						angle = atan(y_move2/x_move2) + PI + (i * PI / 12)
					else:
						angle = atan(y_move2/x_move2) + (i * PI / 12)
					x_move2 = y_move2 * tan(angle)
					var hypotenuse = pow(x_move2, 2) + pow(y_move2, 2)
					var displacement = pow(hypotenuse, 0.5)
					var n = displacement / 1.5
					shot25.x = -x_move2 / n
					shot25.y = -y_move2 / n
					shot25.orig_x = get_pos().x
					shot25.orig_y = get_pos().y
					shot25.id = j + 1
					get_tree().get_root().add_child(shot25)
					
					####################################################
					var x_move2 = x_move
					var y_move2 = y_move
					var shot26 = enemy_shot_26.instance()
					shot26.set_pos(get_pos())
					if x_move2 < 0:
						angle = atan(y_move2/x_move2) + PI + (i * PI / 12)
					else:
						angle = atan(y_move2/x_move2) + (i * PI / 12)
					x_move2 = y_move2 * tan(angle)
					var hypotenuse = pow(x_move2, 2) + pow(y_move2, 2)
					var displacement = pow(hypotenuse, 0.5)
					var n = displacement / 1.5
					shot26.x = x_move2 / n
					shot26.y = y_move2 / n
					shot26.orig_x = get_pos().x
					shot26.orig_y = get_pos().y
					shot26.id = j + 1
					get_tree().get_root().add_child(shot26)
					#####################################################
					var x_move2 = x_move
					var y_move2 = y_move
					var shot26 = enemy_shot_26.instance()
					shot26.set_pos(get_pos())
					if x_move2 < 0:
						angle = atan(y_move2/x_move2) + PI + (i * PI / 12)
					else:
						angle = atan(y_move2/x_move2) + (i * PI / 12)
					x_move2 = y_move2 * tan(angle)
					var hypotenuse = pow(x_move2, 2) + pow(y_move2, 2)
					var displacement = pow(hypotenuse, 0.5)
					var n = displacement / 1.5
					shot26.x = -x_move2 / n
					shot26.y = -y_move2 / n
					shot26.orig_x = get_pos().x
					shot26.orig_y = get_pos().y
					shot26.id = j + 1
					get_tree().get_root().add_child(shot26)
			timer = 10
		for bodies in get_colliding_bodies():
			if bodies.is_in_group("player shot"):
				hp_s6 -= 3
				bodies.queue_free()
			if bodies.is_in_group("player shot 2"):
				hp_s6 -= 2
				bodies.queue_free()
			if bodies.is_in_group("player shot 3"):
				hp_s6 -= 1
				bodies.queue_free()
			life_bar.hp = hp_s6
		if hp_s6 <= 0:
			spell_6 = 2
			timer4 = 0
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()
	elif spell_6 == 2:
		if timer4 == 2:
			get_child(2).play("se_enep01")
			for bodies in get_parent().get_children():
				if bodies.is_in_group("remove"):
					bodies.queue_free()
			var victory_pic = victory.instance()
			victory_pic.set_pos(Vector2(340, 350))
			get_tree().get_root().add_child(victory_pic)
		if timer4 == 30:
			get_child(0).hide()
			get_child(5).hide()