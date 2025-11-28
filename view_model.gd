extends Camera3D
@onready var fps_rig: Node3D = $fps_rig
@onready var animation_player: AnimationPlayer = $fps_rig/light/AnimationPlayer

var light_in_use = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("idle_away")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	fps_rig.position.x = lerp(fps_rig.position.x,0.0,delta * 5)
	fps_rig.position.y = lerp(fps_rig.position.y,0.0,delta * 5)
	
func sway(sway_amount):
	fps_rig.position.x -= sway_amount.x*0.00005
	fps_rig.position.y += sway_amount.y*0.00005
	
func _input(event) -> void:
	if(event.is_action_pressed("handlight")):
		light_in_use = !light_in_use
		if(light_in_use):
			animation_player.play("idle_away")
		else:
			animation_player.play("idle")
	
	
	
	
	
	
