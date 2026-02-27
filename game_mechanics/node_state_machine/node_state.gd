
@icon("res://asset/icons/state.svg")
class_name NodeState
extends Node

var animation_cardinals : Array = ["right","","down","","left","","up"]

@export var player : CharacterBody2D
@export var animated_sprite_2D : AnimatedSprite2D

var velocity : Vector2

@warning_ignore("unused_signal")
signal transition 


func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
