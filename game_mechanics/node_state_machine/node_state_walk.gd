extends NodeState

@export var speed : float = 100.0

func _physics_process(_delta):
	var anim_name = "walk_"
	var direction: Vector2 = GameInputEvent.movement_input() 
	var angle = direction.angle()
	var index = get_4dir_index(angle)
	
	animated_sprite_2d.play(anim_name+animation_cardinals[index])
	
	player.velocity = direction * speed
	player.move_and_slide()
	
	
func _on_next_transitions() -> void:
	if not GameInputEvent.is_movement_input():
		transition.emit("idle")
