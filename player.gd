extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
var score = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * 900
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var vertical_direction := Input.get_axis("jump", "down")
	if vertical_direction:
		velocity.y = vertical_direction * 300
	else:
		velocity.y = 0 

	move_and_slide()
