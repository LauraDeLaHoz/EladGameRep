extends CanvasLayer

var mission_find_key: bool = false


func _ready() -> void:
	print("[MissionUI] _ready()")
	update_ui()

func update_ui() -> void:
	# Buscamos cada label de forma segura y si falta mostramos un mensaje claro
	var m1 := get_node_or_null("VBoxContainer/Mission1")


	if m1 == null:
		push_error("[MissionUI] No se encontró VBoxContainer/Mission1. Revisa el árbol y el nombre del nodo.")
	else:
		m1.text = "Encuentra la llave: " + ("COMPLETADO" if mission_find_key else "?")

	

func complete_key() -> void:
	if not mission_find_key:
		mission_find_key = true
		print("[MissionUI] complete_key() -> ahora COMPLETADO")
		update_ui()
