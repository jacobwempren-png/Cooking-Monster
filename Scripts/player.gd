extends CharacterBody2D


const SPEEDX = 150.0
const SPEEDY = 150.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration up and down.
	var directionY = Input.get_axis("ui_up","ui_down")
	if directionY:
		velocity.y = directionY * SPEEDY
	else:
		velocity.y = move_toward(velocity.y, 0, SPEEDY)

	# Get the input direction and handle the movement/deceleration left and right.
	var directionX = Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEEDX
	else:
		velocity.x = move_toward(velocity.x, 0, SPEEDX)
	
	#Flip the player sprite
	if directionX > 0:
		animated_sprite.flip_h = false
	elif directionX < 0:
		animated_sprite.flip_h = true
		
	#Play Animations
	if directionX == 0:
		animated_sprite.play("IdleLeftRight")
	else:
		animated_sprite.play("WalkLeftRight")
	

	move_and_slide()
	if is_on_floor():
		velocity.y = 0
