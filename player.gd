extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var gravity = Vector2(0,-980)
@export var min_gravity: Vector2 = Vector2(0,-10)
@export var decrease_rate: float = 25.0
@onready var collision_shape = $CollisionShape2D

func _ready():
	collision_shape.disabled = true
	# Wait for the physics frame to settle
	await get_tree().physics_frame 
	collision_shape.disabled = false
	Global.set_score(0)

func die() -> void:
	Global.set_score(0)
	get_tree().reload_current_scene()
	

func get_gravity_1():
	return gravity
	
func _physics_process(delta: float) -> void:
	gravity += Vector2(0,decrease_rate * delta)
	gravity = Vector2(0,max(gravity.y, min_gravity.y))
	if global_position.y > 1000:
		die()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity_1() * delta

	# Handle jump.
	if Input.is_action_just_pressed("up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
