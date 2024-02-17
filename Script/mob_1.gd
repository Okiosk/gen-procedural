extends RigidBody2D

var speed_mob=4
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	velocity.x =1
	velocity.y =1
	
	velocity = velocity.normalized() * speed_mob

	if velocity.x > 0:
		$AnimatedSprite2D.set_flip_h (false)
	elif velocity.x < 0:
		$AnimatedSprite2D.set_flip_h (true)
	move_and_collide(velocity)
