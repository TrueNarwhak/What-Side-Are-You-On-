extends Area2D

export var spring_boost = 200
#export var spring_boost = 3

func _ready():
	pass


func _on_Spring_body_entered(body):
	if body.is_in_group("Player"):
		print_debug(-body.position.direction_to(position) * spring_boost)
		$Boing.play()
		
		if !body.is_on_floor():
			body.motion = -body.get_global_position().direction_to(global_position) * spring_boost
#			body.motion = -body.global_position.normalized() * spring_boost
#			body.motion = -position * spring_boost
