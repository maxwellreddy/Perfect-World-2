extends KinematicBody2D

var x = 0
var y = 0
var rot = 0
var timer = 0
var passed = 0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	if passed == 0:
		set_opacity(0.5)
	else:
		set_opacity(0.8)
	set_rot(timer * 0.05)
	set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	if get_pos().x < -20 and x < 0:
		set_pos(Vector2(700 + x, get_pos().y + y))
		passed += 1
		if passed == 1:
			get_child(2).play("se_kira01")
	elif get_pos().x > 700 and x > 0:
		set_pos(Vector2(-20 + x, get_pos().y + y))
		passed += 1
		if passed == 1:
			get_child(2).play("se_kira01")
	elif get_pos().y < 0 and y < 0:
		set_pos(Vector2(get_pos().x + x, 720 + y))
		passed += 1
		if passed == 1:
			get_child(2).play("se_kira01")
	elif get_pos().y > 720 and y > 0:
		set_pos(Vector2(get_pos().x + x, 0 + y))
		passed += 1
		if passed == 1:
			get_child(2).play("se_kira01")