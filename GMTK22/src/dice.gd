extends RigidBody2D
class_name Dice

export var collect_ammount:int
export var level_index:int = 0

func _ready():
	pass

func _process(delta):
	if collect_ammount == 0:
		print_debug("aa")
		Global.level_show_dice[level_index] = true
		get_tree().change_scene("res://obj/DiceLevelRoom.tscn")
