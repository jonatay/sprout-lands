extends NodeState


func _physics_process(delta):
	var anim_name = "idle_"
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if direction == Vector2.ZERO:
		animated_sprite_2D.play(anim_name+"down")
		return
	var angle = direction.angle()
	var offset = angle / (PI/4)
	var index = wrapi(int(offset), 0, 8)
	animated_sprite_2D.play(anim_name+animation_cardinals[index])
