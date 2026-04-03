extends NodeState
class_name PlayerStateIdle

func on_physics_process(_delta):
	var anim_name = "idle_"

	var direction: Vector2 = player.player_direction
	var angle = direction.angle()
	var index = get_4dir_index(angle) #wrapi(int(offset), 0, 8)

	animated_sprite_2d.play(anim_name+animation_cardinals[index])
	
	
func on_next_transitions() -> void:
	if GameInputEvent.is_movement_input():
		if GameInputEvent.is_run_action_pressed():
			transition.emit("run")
		else:
			transition.emit("walk")
	if GameInputEvent.is_hit_action_pressed():
		match player.current_tool:
			DataTypes.Tools.TOOL_CHOP:
				transition.emit("chop")
			DataTypes.Tools.TOOL_TILL:
				transition.emit("till")
			DataTypes.Tools.TOOL_WATER:
				transition.emit("water")


func on_exit() -> void:
	animated_sprite_2d.stop()
