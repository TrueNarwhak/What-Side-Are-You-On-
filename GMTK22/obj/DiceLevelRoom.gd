extends Node2D

onready var anim = $AnimationPlayer
var level_goto = 0

func _ready():
	if Global.level_show_dice[0]   and !Global.level_show_dice[1]:
		anim.play("1")
		level_goto = 0
	elif Global.level_show_dice[1] and !Global.level_show_dice[2]:
		anim.play("2")
		level_goto = 1
	elif Global.level_show_dice[2] and !Global.level_show_dice[3]:
		anim.play("3")
		level_goto = 2
	elif Global.level_show_dice[3] and !Global.level_show_dice[4]:
		anim.play("4")
		level_goto = 3
	elif Global.level_show_dice[4] and !Global.level_show_dice[5]:
		anim.play("5")
		level_goto = 4
	elif Global.level_show_dice[5]:
		anim.play("6")
		level_goto = 5
	
	print_debug(level_goto)


func _on_AnimationPlayer_animation_finished(anim_name):
	var this_level_goto = level_goto + 1
	
	get_tree().change_scene(Global.all_levels[this_level_goto])
