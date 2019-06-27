extends Node2D

const player = preload("res://Player Scenes/Player.tscn")
const boss = preload("res://Level Scene/Boss.tscn")
const left_boundary = preload("res://Level Scene/Left Boundary.tscn")
const right_boundary = preload("res://Level Scene/Right Boundary.tscn")
const top_boundary = preload("res://Level Scene/Top Boundary.tscn")
const bottom_boundary = preload("res://Level Scene/Bottom Boundary.tscn")
const boss_music = preload("res://Level Scene/Boss Theme.tscn")
const bg = preload("res://Level Scene/Stage Background.tscn")

var timer = 0
var time_stop = false

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	
	if time_stop == false:
		timer += 1
	else:
		timer += 0

	if timer == 1:
		var player1 = player.instance()
		player1.set_pos(player1.get_pos())
		get_tree().get_root().get_child(0).add_child(player1)
		
		var top = top_boundary.instance()
		top.set_pos(top.get_pos())
		get_tree().get_root().get_child(0).add_child(top)
		
		var bottom = bottom_boundary.instance()
		bottom.set_pos(bottom.get_pos())
		get_tree().get_root().get_child(0).add_child(bottom)
		
		var left = left_boundary.instance()
		left.set_pos(left.get_pos())
		get_tree().get_root().get_child(0).add_child(left)
		
		var right = right_boundary.instance()
		right.set_pos(right.get_pos())
		get_tree().get_root().get_child(0).add_child(right)
		
		var background = bg.instance()
		background.set_pos(Vector2(340, 360))
		get_tree().get_root().get_child(0).add_child(background)
		
		var music = boss_music.instance()
		get_tree().get_root().get_child(0).add_child(music)
		music.play("Faint Dream _ Inanimate Dream EoSD-Style Remix")

	if timer == 2:
		var boss1 = boss.instance()
		boss1.set_pos(get_pos())
		get_tree().get_root().add_child(boss1)