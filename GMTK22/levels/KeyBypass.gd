extends Node2D

export(NodePath) var right_cover
export(NodePath) var left_cover
export(NodePath) var z_cover

var go_into = false

func _ready():
	$AnimationPlayer.play("Spin")

func _process(delta):
	if Input.is_action_just_pressed("move_left"):
		get_node(left_cover).show()
		$AA.scale = Vector2(0.5, 2.0)
	if Input.is_action_just_pressed("move_right"):
		get_node(right_cover).show()
		$AA.scale = Vector2(0.5, 2.0)
	if Input.is_action_just_pressed("jump"):
		get_node(z_cover).show()
		$AA.scale = Vector2(0.5, 2.0)
	
	if get_node(right_cover).visible and get_node(left_cover).visible and get_node(z_cover).visible:
		get_tree().change_scene("res://levels/LevelOne.tscn")
	
	$AA.scale.x = lerp($AA.scale.x, 1, 0.1)
	$AA.scale.y = lerp($AA.scale.y, 1, 0.1)


func _on_SwitchTimer_timeout():
	print_debug("aa")
