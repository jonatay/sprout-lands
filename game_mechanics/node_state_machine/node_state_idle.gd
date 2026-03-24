extends NodeState

func get_4dir_index(angle: float) -> int:
	# Normalize angle to 0 - 2*PI
	var normalized_angle = fposmod(angle, PI * 2)
	# Divide into 4 quadrants (90 degrees each)
	var index = round(normalized_angle / (PI / 2))
	# Rounding can result in 4, which is the same as 0 (Right)
	return int(index) % 4

# Usage Example:
# var angle = velocity.angle()
# var direction = get_4dir_index(angle)

func _physics_process(delta):
	var anim_name = "idle_"
	var direction = GameInputEvent.movement_input() #Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction == Vector2.ZERO:
		animated_sprite_2D.play(anim_name+"down")
		return
	var angle = direction.angle()
	#var offset = angle / (PI/4)
	var index = get_4dir_index(angle) #wrapi(int(offset), 0, 8)
	print("%f %d" % [angle, index])
	animated_sprite_2D.play(anim_name+animation_cardinals[index])
