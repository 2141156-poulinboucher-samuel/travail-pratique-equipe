extends KinematicBody2D


onready var _animated_sprite = $Animation
export var gravity = 500.0
export var walk_speed = 100
var test = 0
var velocity = Vector2()

func _physics_process(delta):
	if !is_on_floor():
		velocity.y += delta * gravity
		
	var jump_impulse = velocity.y + 400
	
	_get_input(jump_impulse)
	
	var collision = move_and_slide(velocity, Vector2(0,-1))

	if !collision:
		test+=1
		print(test)
func _get_input(jump_impulse):
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y -= jump_impulse
	if Input.is_action_pressed("left"):
		velocity.x = -walk_speed
	elif Input.is_action_pressed("right"):
		velocity.x =  walk_speed
	else:
		velocity.x = 0
	
func _process(_delta):
	_change_animation()

func _change_animation():
	if Input.is_action_pressed("right"):
		_animated_sprite.flip_h = false
		if is_on_floor():
			_animated_sprite.play("Walk")
	elif Input.is_action_pressed("left"):
		_animated_sprite.flip_h = true
		if is_on_floor():
			_animated_sprite.play("Walk")
	if Input.is_action_pressed("jump"):
		_animated_sprite.play("Jump")
	elif is_on_floor() and velocity.x == 0:
		_animated_sprite.play("Idle")
