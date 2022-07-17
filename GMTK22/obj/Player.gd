# CONTROLLER Y HEARTBEAST

extends KinematicBody2D

const TARGET_FPS = 60
export var ACCELERATION = 8
export var MAX_SPEED = 64
export var FRICTION = 10
export var AIR_RESISTANCE = 1.0
export var GRAVITY = 4
export var JUMP_FORCE = 140
export var jump_death_force = 10
export var wall_jump_force_x = 90
export var wall_jump_force_y = 70

var is_dead = false

var motion = Vector2.ZERO

onready var anim = $AnimationPlayer
onready var raycast = $Raycast
onready var sprite = $Sprite

func _physics_process(delta):
	var x_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	
	if x_input != 0:
		motion.x += x_input * ACCELERATION * delta * TARGET_FPS
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
	
	motion.y += GRAVITY * delta * TARGET_FPS
	
	if is_on_floor() or is_on_wall():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION * delta)
			
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMP_FORCE
		
		if Input.is_action_just_released("jump") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2
		
		if x_input == 0:
			motion.x = lerp(motion.x, 0, AIR_RESISTANCE * delta)
	
	motion = move_and_slide(motion, Vector2.UP)
	
	global_rotation = 0

func die():
	is_dead = true
	motion.y = -jump_death_force
	anim.play("Die")


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "Die":
		get_tree().reload_current_scene()
