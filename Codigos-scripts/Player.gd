extends CharacterBody2D

const Xlr8 = 1000
const MAX_SPEED = 100
const FRICTION = 800
var vemvemaqui = velocity
# vemvemaqui created to fix issue when coliding with objects

@onready var animationPlayer = $AnimationPlayer
# its gonna call the node from the same family that is called AnimationPlayer so the character can get his animations
# and the @onready makes that the variable will only be created when the game is ready
@onready var animationTree = $AnimationTree
@onready var animationState = animationTree.get("parameters/playback")


func _physics_process(delta):
	
	var input_vector = Vector2.ZERO

	motion_mode = MOTION_MODE_FLOATING
	#fixes sliding in walls without slowdown

	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	


	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, Xlr8 * delta)

	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	vemvemaqui = move_and_slide()























#const speed = 5

#var speed = 100



#func get_input():

#	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

#	velocity = input_direction * speed



#func _physics_process(_delta):

#	get_input()

#	move_and_slide()

# -----------------------------------------------------

#	if Input.is_action_pressed("ui_right"):
#		velocity.x = speed
#		velocity.y = 0
# 	elif Input.is_action_pressed("ui_left"):
#		velocity.x = -speed
#		velocity.y = 0
#	elif Input.is_action_pressed("ui_up"):
#		velocity.x = 0
#		velocity.y = -speed
#	elif Input.is_action_pressed("ui_down"):
#		velocity.x = 0
#		velocity.y = speed
#	else:
#		velocity.x = 0
#		velocity.y = 0
#	move_and_collide(velocity)
