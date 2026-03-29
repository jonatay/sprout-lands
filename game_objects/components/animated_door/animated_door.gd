extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var interactable_component: InteractableComponent = $InteractableComponent


func _ready():
	interactable_component.interactable_activated.connect(_on_interactable_activated)
	interactable_component.interactable_deactivated.connect(_on_interactable_deactivated)

func _on_interactable_activated(_body):
	animated_sprite_2d.play("open_door")
	animated_sprite_2d.animation_finished.connect(func(): collision_shape_2d.disabled = true)

func _on_interactable_deactivated(_body):
	animated_sprite_2d.play("close_door")
	animated_sprite_2d.animation_finished.connect(func(): collision_shape_2d.disabled = false)
