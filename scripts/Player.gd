extends KinematicBody2D

"""
Déclaration des variables globales au script
"""
onready var _animated_sprite = $Animation
export var gravity = 500.0
export var walk_speed = 150
export var value_jump_impulse = 375
var velocity = Vector2()
signal endgame

var score = 0

"""
Fonction effectuée toutes les 16 millièmes de secondes
Gère les déplacements
Gère les animations
"""
func _physics_process(delta):
	if !is_on_floor():
		velocity.y += delta * gravity
	var jump_impulse = velocity.y + value_jump_impulse
	if velocity.y > 375:
		velocity.y = 375
	if is_on_ceiling() and velocity.y < 0:
		velocity.y = 1
		
	_get_input(jump_impulse)
	_change_animation()
	move_and_slide(velocity, Vector2(0,-1))
	
"""
Fonction qui effectue le déplacement du joueur en déterminant quelle touche est appuyé
"""
func _get_input(jump_impulse):
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= jump_impulse
	if Input.is_action_pressed("left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("right"):
		velocity.x =  walk_speed
	else:
		velocity.x = 0

"""
Change l'animation du joueur en fonction de ses déplacements
"""
func _change_animation():
	if Input.is_action_pressed("right"):
		_animated_sprite.flip_h = false
		if is_on_floor():
			_animated_sprite.play("Walk")
	elif Input.is_action_pressed("left"):
		_animated_sprite.flip_h = true
		if is_on_floor():
			_animated_sprite.play("Walk")
	if Input.is_action_just_pressed("jump"):
		_animated_sprite.play("Jump")
	elif is_on_floor() and velocity.x == 0:
		_animated_sprite.play("Idle")
