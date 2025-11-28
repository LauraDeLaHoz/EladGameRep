extends Node3D

@onready var target = $Player

func _ready():
	var qs = get_tree().get_first_node_in_group("QuestSystem")
	if qs:
		qs.start_quest(1)  # ID de tu quest
		print("Misión FINDKEY iniciada automáticamente")
	else:
		print("ERROR: No se encontró el QuestSystem en la escena")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_tree().call_group("enemy", "target_position", target.global_transform.origin)
