extends NodeState


func on_enter() -> void:
	var anim_name = "chop"

	var direction: Vector2 = player.player_direction 
	var angle = direction.angle()
	var index = get_4dir_index(angle)
	
	animated_sprite_2d.play("%s_%s" % [anim_name, animation_cardinals[index]])

func on_next_transitions() -> void:
	if not animated_sprite_2d.is_playing():
		transition.emit("idle")
