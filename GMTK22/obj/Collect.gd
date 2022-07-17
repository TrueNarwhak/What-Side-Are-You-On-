extends Area2D

onready var anim = $AnimationPlayer

func _ready():
	anim.play("Spinnn")


func _on_Collect_body_entered(body):
	if body.is_in_group("Player") and !body.is_dead:
		print_debug("through!")
		get_parent().get_parent().collect_ammount -= 1
		queue_free()
