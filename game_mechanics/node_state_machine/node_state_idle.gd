extends NodeState

func on_physics_process(_delta):
	var anim_name = "idle_"

	var direction: Vector2 = player.player_direction
	var angle = direction.angle()
	var index = get_4dir_index(angle) #wrapi(int(offset), 0, 8)

	animated_sprite_2d.play(anim_name+animation_cardinals[index])
	
	
func on_next_transitions() -> void:
	if GameInputEvent.is_movement_input():
		transition.emit("walk")
