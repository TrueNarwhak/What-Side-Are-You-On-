extends Area2D


func _ready():
	pass


func _on_Spikes_body_entered(body):
	if body.is_in_group("Player") and !body.is_dead:
		body.die()
		$Stab.play()
