extends CharacterBody3D

@onready var nav = $NavigationAgent3D
var speed = 3.5
var gravity = 9.8

func _process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta 
	else: 
		velocity.y = -2
	
	var next_location = nav.get_next_path_position()
	var direction = (next_location - global_transform.origin).normalized()

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	move_and_slide()
	
func target_position(target):
	nav.target_position = target 
	
	

	
	
	
