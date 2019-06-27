extends RigidBody2D
const enemy_shot_1 = preload("res://Level Scene/Enemy Bullet 6.tscn")

var timer = 0
var x = 0
var y = 0

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	timer += 1
	
	set_pos(Vector2(get_pos().x, y + sin(timer * 0.05) * 30))

	if timer % 5 == 0:
		get_child(0).play("se_kira02")
		var enemy_shot = enemy_shot_1.instance()
		enemy_shot.set_pos(Vector2(get_pos().x, get_pos().y))
		enemy_shot.x = 10
		get_tree().get_root().add_child(enemy_shot)