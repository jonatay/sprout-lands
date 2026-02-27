class_name GameInputEvent
extends Node

static func movement_input():
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")


