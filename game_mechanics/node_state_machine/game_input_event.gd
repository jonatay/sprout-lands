class_name GameInputEvent
extends Node



static func movement_input() -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()


static func is_movement_input() -> bool:
	return movement_input() != Vector2.ZERO
