extends Area2D

export var dice_boost = Vector2(500, 0)

func _ready():
	pass


func _on_BoostDice_body_entered(body):
	if body is Dice:
		body.apply_impulse(global_position, dice_boost)
