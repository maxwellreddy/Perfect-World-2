extends RigidBody2D
var x = 0
var y = 0
var deathspot_x = 0
var deathspot_y = 0
var lives = 5
var bombs = 2
var lives_created = false
var bombs_created = false
var invincible_time = 100
var deathbomb_time = 16
var got_hit = false
var shot_time = 0
var game_over_time = 0
var game_over_time_increaser = 0
var bomb_time = 120
var timer = 0

const player_shot = preload("res://Player Scenes/Player Shot.tscn")
const player_shot_2 = preload("res://Player Scenes/Player Shot 2.tscn")
const player_shot_3 = preload("res://Player Scenes/Player Shot 3.tscn")
const lives_spawn = preload("res://Player Scenes/Lives.tscn")
const bombs_spawn = preload("res://Player Scenes/Bombs.tscn")
const player_bomb = preload("res://Player Scenes/Player Bomb.tscn")
const game_over_screen = preload("res://Game Over Scene/Game Over Screen.tscn")

var left_key_pressed = false
var right_key_pressed = false
var up_key_pressed = false
var down_key_pressed = false
var focus_pressed = false
var shot_pressed = false
var bomb_pressed = false

func _ready():
	set_fixed_process(true)
	set_process_input(true)

func _fixed_process(delta):
	if left_key_pressed == true:
		if focus_pressed == true:
			if up_key_pressed == true:
				x = pow(2, 0.5)
				y = pow(2, 0.5)
				set_pos(Vector2(get_pos().x - x, get_pos().y - y))

			elif down_key_pressed == true:
				x = pow(2, 0.5)
				y = pow(2, 0.5)
				set_pos(Vector2(get_pos().x - x, get_pos().y + y))
								
			elif right_key_pressed == true:
				x = 0
				y = 0
				set_pos(Vector2(get_pos().x, get_pos().y))

			else:
				x = 2
				set_pos(Vector2(get_pos().x - x, get_pos().y))

		else:
			if up_key_pressed == true:
				x = 2.5 * pow(2, 0.5)
				y = 2.5 * pow(2, 0.5)
				set_pos(Vector2(get_pos().x - x, get_pos().y - y))

			elif down_key_pressed == true:
				x = 2.5 * pow(2, 0.5)
				y = 2.5 * pow(2, 0.5)
				set_pos(Vector2(get_pos().x - x, get_pos().y + y))

			elif right_key_pressed == true:
				x = 0
				y = 0
				set_pos(Vector2(get_pos().x, get_pos().y))

			else:
				x = 5
				set_pos(Vector2(get_pos().x - x, get_pos().y))

	elif right_key_pressed == true:
		if focus_pressed == true:
			if up_key_pressed == true:
				x = pow(2, 0.5)
				y = pow(2, 0.5)
				set_pos(Vector2(get_pos().x + x, get_pos().y - y))

			elif down_key_pressed == true:
				x = pow(2, 0.5)
				y = pow(2, 0.5)
				set_pos(Vector2(get_pos().x + x, get_pos().y + y))

			elif left_key_pressed == true:
				x = 0
				y = 0
				set_pos(Vector2(get_pos().x, get_pos().y))

			else:
				x = 2
				set_pos(Vector2(get_pos().x + x, get_pos().y))

		else:
			if up_key_pressed == true:
				x = 2.5 * pow(2, 0.5)
				y = 2.5 * pow(2, 0.5)
				set_pos(Vector2(get_pos().x + x, get_pos().y - y))

			elif down_key_pressed == true:
				x = 2.5 * pow(2, 0.5)
				y = 2.5 * pow(2, 0.5)
				set_pos(Vector2(get_pos().x + x, get_pos().y + y))

			elif left_key_pressed == true:
				x = 0
				y = 0
				set_pos(Vector2(get_pos().x, get_pos().y))

			else:
				x = 5
				set_pos(Vector2(get_pos().x + x, get_pos().y))

	elif up_key_pressed == true:
		if focus_pressed == true:
			if left_key_pressed == true:
				x = pow(2, 0.5)
				y = pow(2, 0.5)
				set_pos(Vector2(get_pos().x - x, get_pos().y - y))

			elif right_key_pressed == true:
				x = pow(2, 0.5)
				y = pow(2, 0.5)
				set_pos(Vector2(get_pos().x + x, get_pos().y - y))

			elif down_key_pressed == true:
				x = 0
				y = 0
				set_pos(Vector2(get_pos().x, get_pos().y))

			else:
				y = 2
				set_pos(Vector2(get_pos().x, get_pos().y - y))

		else:
			if left_key_pressed == true:
				x = 2.5 * pow(2, 0.5)
				y = 2.5 * pow(2, 0.5)
				set_pos(Vector2(get_pos().x - x, get_pos().y - y))

			elif right_key_pressed == true:
				x = 2.5 * pow(2, 0.5)
				y = 2.5 * pow(2, 0.5)
				set_pos(Vector2(get_pos().x + x, get_pos().y - y))

			elif down_key_pressed == true:
				x = 0
				y = 0
				set_pos(Vector2(get_pos().x, get_pos().y))

			else:
				y = 5
				set_pos(Vector2(get_pos().x, get_pos().y - y))

	elif down_key_pressed == true:
		if focus_pressed == true:
			if left_key_pressed == true:
				x = pow(2, 0.5)
				y = pow(2, 0.5)
				set_pos(Vector2(get_pos().x - x, get_pos().y + y))

			elif right_key_pressed == true:
				x = pow(2, 0.5)
				y = pow(2, 0.5)
				set_pos(Vector2(get_pos().x + x, get_pos().y + y))

			elif up_key_pressed == true:
				x = 0
				y = 0
				set_pos(Vector2(get_pos().x, get_pos().y))

			else:
				y = 2
				set_pos(Vector2(get_pos().x, get_pos().y + y))

		else:
			if left_key_pressed == true:
				x = 2.5 * pow(2, 0.5)
				y = 2.5 * pow(2, 0.5)
				set_pos(Vector2(get_pos().x - x, get_pos().y + y))

			elif right_key_pressed == true:
				x = 2.5 * pow(2, 0.5)
				y = 2.5 * pow(2, 0.5)
				set_pos(Vector2(get_pos().x + x, get_pos().y + y))

			elif up_key_pressed == true:
				x = 0
				y = 0
				set_pos(Vector2(get_pos().x, get_pos().y))
			else:
				y = 5
				set_pos(Vector2(get_pos().x, get_pos().y + y))

	if get_pos().x <= 40:
		x = 0
		set_pos(Vector2(40, get_pos().y))
	if get_pos().y <= 60:
		y = 0
		set_pos(Vector2(get_pos().x, 60))
	if get_pos().x >= 640:
		x = 0
		set_pos(Vector2(640, get_pos().y))
	if get_pos().y >= 660:
		y = 0
		set_pos(Vector2(get_pos().x, 660))
	
	
	
	shot_time += 1
	bomb_time += 1
	if shot_pressed == true:
		if shot_time >= 3:
			
			var shot = player_shot.instance()
			shot.set_pos(Vector2(get_pos().x, get_pos().y - 20))
			shot.y = - 10
			get_tree().get_root().add_child(shot)
			
			var shot2 = player_shot_2.instance()
			shot2.set_pos(Vector2(get_pos().x, get_pos().y - 20))
			shot2.x = cos(11*PI/24) * 10
			shot2.y = -(sin(11*PI/24) * 10)
			get_tree().get_root().add_child(shot2)
			
			var shot3 = player_shot_2.instance()
			shot3.set_pos(Vector2(get_pos().x, get_pos().y - 20))
			shot3.x = cos(13*PI/24) * 10
			shot3.y = -(sin(13*PI/24) * 10)
			get_tree().get_root().add_child(shot3)
			
			var shot4 = player_shot_3.instance()
			shot4.set_pos(Vector2(get_pos().x, get_pos().y - 20))
			shot4.x = cos(5*PI/12) * 10
			shot4.y = -(sin(5*PI/12) * 10)
			get_tree().get_root().add_child(shot4)
			
			var shot5 = player_shot_3.instance()
			shot5.set_pos(Vector2(get_pos().x, get_pos().y - 20))
			shot5.x = cos(7*PI/12) * 10
			shot5.y = -(sin(7*PI/12) * 10)
			get_tree().get_root().add_child(shot5)
			shot_time = 0
			
	if bomb_pressed == true and bomb_time >= 120 and bombs > 0:
		got_hit = false
		get_child(3).hide()
		bomb_time = 0
		deathbomb_time = 16
		invincible_time = 50
		var bomb = player_bomb.instance()
		bomb.set_pos(Vector2(340, 360))
		get_tree().get_root().add_child(bomb)
		get_child(5).play("se_playerdead")
		bombs -= 1
		for bodies in get_tree().get_root().get_children():
				if bodies.is_in_group("bomb icon") and bodies.bomb_number == bombs:
					bodies.queue_free()
		
	
	invincible_time += 1
	
	if invincible_time < 200 and invincible_time % 2 == 0:
		get_child(0).set_opacity(0.5)
	elif (invincible_time < 200 and invincible_time % 2 == 1) or invincible_time >= 200:
		get_child(0).set_opacity(1)
		
	if lives <= 0:
		game_over_time_increaser = 1
		if game_over_time == 50:
			var game_over = game_over_screen.instance()
			game_over.set_pos(game_over.get_pos())
			get_tree().get_root().add_child(game_over)
			for bodies2 in get_tree().get_root().get_children():
				if bodies2.is_in_group("life") == false:
					bodies2.queue_free()
			var game_over = game_over_screen.instance()
			game_over.set_pos(get_pos())
			get_tree().get_root().add_child(game_over)
			queue_free()
	
	game_over_time += game_over_time_increaser
	
	if got_hit == true:
		if deathbomb_time == 16:
			x = 0
			y = 0
			set_pos(Vector2(get_pos().x, get_pos().y))
			get_child(4).play("se_focusfix2")
		deathbomb_time -= 1
		get_child(3).show()
		if deathbomb_time == 0:
			get_child(4).play("se_pldead00")
			lives -= 1
			get_child(3).hide()

			if lives > 0:
				invincible_time = 0
				for bodies2 in get_tree().get_root().get_children():
					if bodies2.is_in_group("life") and bodies2.life_number == lives - 1:
						bodies2.queue_free()
				got_hit = false
				deathbomb_time = 16
				bombs = 2
				bombs_created = false
			

		else:
			x = deathspot_x
			y = deathspot_y
			shot_time = 0
	
	if invincible_time >= 200:
		for bodies in get_colliding_bodies():
			if bodies.is_in_group("enemy bullet") or bodies.is_in_group("enemy bullet 2") or bodies.is_in_group("enemy bullet 3") or (bodies.is_in_group("enemy bullet 6") and bodies.id == 0) or (bodies.is_in_group("enemy bullet 6") and bodies.id == 1 and bodies.timer > 70):
				got_hit = true
				deathspot_x = x
				deathspot_y = y
				bodies.queue_free()
			if bodies.is_in_group("enemy bullet 7") and bodies.passed >= 1:
				got_hit = true
				deathspot_x = x
				deathspot_y = y
			if (bodies.is_in_group("enemy laser") and bodies.timer > 90) or bodies.is_in_group("enemy bullet 4") or bodies.is_in_group("enemy bullet 5"):
				got_hit = true
				deathspot_x = x
				deathspot_y = y
				
	else:
		for bodies in get_colliding_bodies():
			if bodies.is_in_group("enemy bullet") or bodies.is_in_group("enemy bullet 2"):
				bodies.queue_free()
				
	if lives_created == false:
		for i in range(lives - 1):
			var life = lives_spawn.instance()
			life.set_pos(Vector2(700 + 40 * i, 300))
			life.life_number = i
			get_tree().get_root().add_child(life)
		lives_created = true
		
	if bombs_created == false:
		for i in range(bombs):
			var new_bomb = bombs_spawn.instance()
			new_bomb.set_pos(Vector2(700 + 40 * i, 350))
			new_bomb.bomb_number = i
			get_tree().get_root().add_child(new_bomb)
		bombs_created = true
	
	if focus_pressed == true:
		get_child(1).show()
	else:
		get_child(1).hide()
	
	
func _input(event):
	if event.is_action_pressed("ui_z"):
		focus_pressed = true
	if event.is_action_released("ui_z"):
		focus_pressed = false
	if event.is_action_pressed("ui_left"):
		left_key_pressed = true
	if event.is_action_released("ui_left"): 
		left_key_pressed = false
	if event.is_action_pressed("ui_right"): 
		right_key_pressed = true
	if event.is_action_released("ui_right"): 
		right_key_pressed = false
	if event.is_action_pressed("ui_up"): 
		up_key_pressed = true
	if event.is_action_released("ui_up"): 
		up_key_pressed = false
	if event.is_action_pressed("ui_down"): 
		down_key_pressed = true
	if event.is_action_released("ui_down"): 
		down_key_pressed = false
	if event.is_action_pressed("ui_x"):
		shot_pressed = true
	if event.is_action_released("ui_x"):
		shot_pressed = false
	if event.is_action_pressed("ui_c"):
		bomb_pressed = true
	if event.is_action_released("ui_c"):
		bomb_pressed = false