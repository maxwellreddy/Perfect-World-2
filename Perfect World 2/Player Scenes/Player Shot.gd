extends KinematicBody2D
var x = 0
var y = 0
var z = 0
const shot_sound = preload("res://Player Scenes/Player Shot Sound.tscn")
var sound_played = false
func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if sound_played == false:
		var sound = shot_sound.instance()
		add_child(sound)
		sound.play("se_plst00")
		sound_played = true
	set_pos(Vector2(get_pos().x + x, get_pos().y + y))
	z -= 10

	if z <= -800:
		queue_free()