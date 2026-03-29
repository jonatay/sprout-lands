extends Node2D
class_name DamageComponent

@export var max_damage : int = 1
@export var current_damage : int = 0

signal max_damage_reached

func apply_damage(amount: int = 1) -> void:
	current_damage = clamp(current_damage + amount, 0, max_damage)
	if current_damage == max_damage:
		max_damage_reached.emit()
