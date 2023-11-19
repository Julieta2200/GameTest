extends CharacterBody2D

var speed = 100
var player = null
var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if entered:
		var direction = (player.position - position)/speed
		velocity=direction * speed
		move_and_slide()
		
		


func _on_area_2d_body_entered(body):
	player = body
	entered = true


func _on_area_2d_body_exited(body):
	player = null
	entered = false
	
