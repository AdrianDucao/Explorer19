extends KinematicBody2D

#movements
const UP = Vector2(0, -1)
var motion = Vector2()
var speed = 300
var gravity = 15
var jump = -300
var on_ground = true

func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
		$AnimatedSprite.play("walk-right")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
		$AnimatedSprite.play("walk-left")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_just_released("ui_left"):
		motion.x = 0
		$AnimatedSprite.play("idle2")
	elif Input.is_action_just_released("ui_right"):
		motion.x = 0
		$AnimatedSprite.play("idle1")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = jump
			on_ground = false
			#if on_ground == false:
			#	$AnimatedSprite.play("fall-right")
			#else:
			#	$AnimatedSprite.play("idle1")
	
	move_and_slide(motion, UP)
