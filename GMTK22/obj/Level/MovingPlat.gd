extends StaticBody2D


func _ready():
	pass

func _process(delta):
	position.y -= 1

func _on_DetectBox_body_exited(body):
	if body.is_in_group("Player"):
		var new_parent = get_parent()
