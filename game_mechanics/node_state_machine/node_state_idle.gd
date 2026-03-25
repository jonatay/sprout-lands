extends NodeState

func _physics_process(_delta):
	var anim_name = "idle_"
	var direction: Vector2 = GameInputEvent.movement_input() 
	if direction == Vector2.ZERO:
		animated_sprite_2d.play(anim_name+"down")
		return
	var angle = direction.angle()
	#var offset = angle / (PI/4)
	var index = get_4dir_index(angle) #wrapi(int(offset), 0, 8)
	print("%f %d" % [angle, index])
	animated_sprite_2d.play(anim_name+animation_cardinals[index])
	
	
func _on_next_transitions() -> void:
	if GameInputEvent.is_movement_input():
		transition.emit("walk")
