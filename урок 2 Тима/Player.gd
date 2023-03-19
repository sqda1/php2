extends KinematicBody2D


var Speed = 200
var Gravity = 12
var Jump = 800

var Up = Vector2(0, -1)
var Velocity = Vector2()

func _physics_process(delta):
	Velocity = move_and_slide(Velocity,Up)
	pass


func Keyboard():
	if Input.is_action_pressed("ui_left"):
		Velocity.x = - Speed
		$AnimatedSprite.play("Движение")
		$AnimatedSprite.flip_h = false

	elif Input.is_action_pressed("ui_right"):
		Velocity.x = Speed
		$AnimatedSprite.play("Движение")
		$AnimatedSprite.flip_h = true
	else:
		Velocity.x = 0
		$AnimatedSprite.play("Стойка")	
	

	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			Velocity.y = - Jump
			$AnimatedSprite.play("Прыжок")


func _process(delta):
	
	Velocity.y += Gravity
	Keyboard()
	pass






