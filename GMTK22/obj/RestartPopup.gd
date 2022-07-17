extends Node2D


func _ready():
	pass

func _process(delta):
	if visible and Input.is_action_pressed("jump"):
		get_tree().change_scene("res://levels/LevelOne.tscn")
