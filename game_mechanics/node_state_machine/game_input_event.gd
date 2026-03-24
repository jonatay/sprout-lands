class_name GameInputEvent
extends Node



static func movement_input():
	return Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()


static func is_movement_input():
	return movement_input() != Vector2.ZERO
