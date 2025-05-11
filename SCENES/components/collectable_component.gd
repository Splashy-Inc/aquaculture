class_name CollectableComponent
extends Area2D

@export var collectable_name: String
@onready var sound: AudioStreamPlayer2D = $CollectSFX

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		sound.play()
		InventoryManager.add_collectable(collectable_name)
		print("Collected:", collectable_name)
		var parent = get_parent()
		parent.hide()
		await sound.finished
		parent.queue_free()
	
