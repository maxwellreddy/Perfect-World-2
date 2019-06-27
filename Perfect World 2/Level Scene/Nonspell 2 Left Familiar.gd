extends RigidBody2D
const enemy_shot_1 = preload("res://Level Scene/Enemy Bullet 5.tscn")

var timer = 0
var change_time = 44
var wait_time = 10
var x = 0
var y = 0
var z = 5

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	
	if timer >= 1 and timer <= change_time + wait_time:
		if timer % z == 0:
			y -= timer / z
		set_pos(Vector2(get_pos().x, get_pos().y + y))
	
	if timer == change_time + wait_time:
		y = 0
		set_pos(Vector2(get_pos().x, 60 + rand_range(-15, 0)))
	
	if timer >= (change_time + wait_time) and timer <= (2 * change_time + wait_time * 2):
		if (timer - change_time - wait_time) % z == 0:
			y += (timer - change_time - wait_time) / z
		set_pos(Vector2(get_pos().x, get_pos().y + y))
	
	if timer == change_time * 2 + wait_time * 2:
		timer = 0
		y = 0
		set_pos(Vector2(get_pos().x, 660 + rand_range(0, 15)))

	if timer % 2 == 0 and ((timer >= 1 and timer <= change_time) or (timer >= (change_time + wait_time) and timer <= (2 * change_time) + wait_time)):
		#get_child(0).play("se_tan01")
		var enemy_shot = enemy_shot_1.instance()
		enemy_shot.set_pos(Vector2(get_pos().x, get_pos().y))
		enemy_shot.x = 10
		get_tree().get_root().add_child(enemy_shot)