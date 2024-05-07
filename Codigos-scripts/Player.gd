extends CharacterBody2D

const Xlr8 = 10
const MAX_SPEED = 120
const FRICTION = 20

func _physics_process(delta):

	var input_vector = Vector2.ZERO

	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector2.ZERO:
		velocity += input_vector * Xlr8 * delta
		#adicionando o + com o sinal de igual, faz com que o valor seja adicionado a cada frame, xlr8 que é a aceleração, seja adicionado de pouco a pouco para chegar até a vel max
		velocity = velocity.limit_length(MAX_SPEED * delta)

	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move_and_collide(velocity)























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
