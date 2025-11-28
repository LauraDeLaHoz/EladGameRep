extends Area3D

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	print("[Key] ready, esperando colisiones")

func _on_body_entered(body: Node) -> void:
	print("[Key] body_entered por: ", body.name)
	if not body:
		return

	if body.is_in_group("player"):
		print("[Key] Llave recogida por player")

		# Buscamos CanvasLayer dentro de la escena 'world'
		var ui := get_tree().get_root().get_node_or_null("world/CanvasLayer")
		if ui:
			print("[Key] Llamando a complete_key() en MissionUI")
			ui.call_deferred("complete_key")
		else:
			push_error("[Key] No se encontró world/CanvasLayer. Revisa que el nodo CanvasLayer esté en la escena 'world' y que la ruta sea exactamente esa.")

		queue_free()
