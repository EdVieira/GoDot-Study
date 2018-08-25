extends KinematicBody

var speed = 600
var direction = Vector3() # tipo de variavel que guarda 3 valores: x,y,z
var gravity = -9.8
var velocity = Vector3()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	direction = Vector3(0,0,0) # vetor de direções
	if Input.is_action_pressed("ui_left"): # evento da tecla para esquerda
		direction.x -= 1 # atualização da direção
	if Input.is_action_pressed("ui_right"): # evento da tecla para direita
		direction.x += 1 # atualização da direção
	if Input.is_action_pressed("ui_up"): # evento da tecla para cima
		direction.z -= 1 # atualização da direção
	if Input.is_action_pressed("ui_down"): # evento da tecla para baixo
		direction.z += 1 # atualização da direção
	direction = direction.normalized()
	# delta é o tempo levado desde a ultima chamada de _physics_process
	direction = direction*speed*delta
	# trata gravidade caso o player esteja no ar (cair mais rápido)
	if velocity.y > 0:
		gravity = -20
	else:
		gravity = -30
	# aplica gravidade
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	# atribui para velocity, para tratar a gravidade cumulativa
	# permite que o player consiga subir por rampas
	velocity = move_and_slide(velocity, Vector3(0,1,0))
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y = 10
	
	# Colisão com a bola
	var hitCount = get_slide_count()
	if hitCount > 0:
		# KnematicCollision
		var collision = get_slide_collision(0)
		if collision.collider is RigidBody:
			# apply_impulse(position, direction)
			# -direction aplica força na direção contrária
			collision.collider.apply_impulse(collision.position, -collision.normal)