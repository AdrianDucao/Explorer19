extends KinematicBody2D

#movements
const UP = Vector2(0, -1)
var motion = Vector2()
var speed = 300
var gravity = 15
var jump = -300
var on_ground = false

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
	elif Input.is_action_pressed("ui_up"):
		if on_ground == true:
			motion.y = jump
			on_ground = false
	else:
		motion.x = 0
		$AnimatedSprite.play("idle1")
		if on_ground == true:
			$AnimatedSprite.play("idle1")
	
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):
			motion.y = jump
	
	move_and_slide(motion, UP)
