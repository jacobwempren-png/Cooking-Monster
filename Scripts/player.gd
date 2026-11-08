extends CharacterBody2D

@export var speed: float = 150.0
@onready var animated_sprite = $AnimatedSprite2D

#Keep track of the last non-zero direction (default to down)
var last_direction: Vector2 = Vector2.DOWN

func _physics_process(delta: float) -> void:
	#Get 2D input direction (returns a Vector2)
	var direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * speed
		#Update tracking variable every time the player moves
		last_direction = direction
		
		#Check vertical vs horizontal dominance or direct y-axis
		if direction.y < 0:
			animated_sprite.play("WalkUp")
		elif direction.y > 0:
			animated_sprite.play("WalkDown")
		elif direction.x < 0:
			animated_sprite.play("WalkLeft")
		elif direction.x > 0:
			animated_sprite.play("WalkRight")
	else:
		velocity = Vector2.ZERO
		
		#Play idle animation based on the last recorded direction
		if last_direction.y < 0:
			animated_sprite.play("IdleUp")
		elif last_direction.y > 0:
			animated_sprite.play("IdleDown")
		elif last_direction.x > 0:
			animated_sprite.play("IdleRight")
		elif last_direction.x < 0:
			animated_sprite.play("IdleLeft")

	move_and_slide()
