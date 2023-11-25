extends CharacterBody2D

var speed = 1500
var player = null
var direction
var timeout = false
var playerPosition
var distance = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if timeout:
		direction = playerPosition 
		velocity = direction * (speed)
		move_and_slide()
		distance = direction
		

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player = body
		$Timer.start()
	

func _on_timer_timeout():
	playerPosition = (player.position - position).normalized()
	timeout = true


func _on_area_2d_2_body_entered(body):
	if body.name == "Player":
		$".".queue_free()
