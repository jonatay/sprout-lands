extends NodeState

@export var speed : float = 120.0

func on_physics_process(_delta):
	var anim_name = "run_"

	var direction: Vector2 = GameInputEvent.movement_input() 
	var angle = direction.angle()
	var index = get_4dir_index(angle)
	
	animated_sprite_2d.play(anim_name+animation_cardinals[index])

	if direction != Vector2.ZERO:
		player.player_direction = direction
	
	player.velocity = direction * speed
	player.move_and_slide()
	
	
func on_next_transitions() -> void:
	if not GameInputEvent.is_movement_input() or not GameInputEvent.is_run_action_pressed():
		transition.emit("idle")

func on_exit() -> void:
	animated_sprite_2d.stop()
