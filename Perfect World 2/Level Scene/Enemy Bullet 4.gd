extends KinematicBody2D

var x = 0
var y = 0
var timer = 0
var orig_x = 0
var orig_y = 0
var orig_rot = 0
var id = 0
var rot = 0

const laser_spawn = preload("res://Level Scene/Enemy Laser 2.tscn")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	set_pos(Vector2(get_pos().x + x, get_pos().y + y ))
	var player_x = get_parent().get_child(0).get_child(0).get_pos().x - get_pos().x
	var player_y = get_parent().get_child(0).get_child(0).get_pos().y - get_pos().y
	
	if get_pos().x < 0 or get_pos().x > 680 :
		queue_free()
	elif get_pos().y < 60 or get_pos().y > 660:
		var laser = laser_spawn.instance()
		laser.set_pos(Vector2(get_pos().x, get_pos().y))
		
		laser.set_rot(atan(player_x/player_y))
		
		get_tree().get_root().add_child(laser)
		queue_free()