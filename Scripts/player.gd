extends CharacterBody2D


const SPEEDX = 150.0
const SPEEDY = 150.0


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration up and down.
	var directionY := Input.get_axis("ui_up","ui_down")
	if directionY:
		velocity.y = directionY * SPEEDY
	else:
		velocity.y = move_toward(velocity.y, 0, SPEEDY)

	# Get the input direction and handle the movement/deceleration left and right.
	var directionX := Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEEDX
	else:
		velocity.x = move_toward(velocity.x, 0, SPEEDX)

	move_and_slide()
