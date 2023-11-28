extends RigidBody2D

var player : CharacterBody2D 
var speed : int = 500
var start_position : Vector2
const max_distance : int = 600

func _ready():
	start_position = position

func _process(_delta):
	if check_distance():
		queue_free()
	

func _on_area_2d_body_entered(body):
	if body.name == "Player":
		player = body
		$Timer.start()

func _on_timer_timeout():
	var direction = (player.position - position).normalized() 
	linear_velocity = direction * speed
	

func _on_contact_area_body_entered(body):
	if body.name == "Player":
		queue_free()

func get_dictance() -> float:
	return (position - start_position).length_squared()
	

func check_distance() -> bool:
	return get_dictance() > max_distance * max_distance
