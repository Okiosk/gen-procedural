extends CharacterBody2D


var speed = 100000
# Called when the node enters the scene tree for the first time.
func _ready():
	position=Vector2(600,100)
	var fli = false

func _process(delta):
	

	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed * delta
	move_and_slide()
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	if velocity.x > 0:
		$AnimatedSprite2D.set_flip_h (false)
	elif velocity.x < 0:
		$AnimatedSprite2D.set_flip_h (true)
