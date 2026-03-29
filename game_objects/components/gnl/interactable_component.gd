extends Area2D
class_name InteractableComponent

signal interactable_activated
signal interactable_deactivated

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	print("body entered: ", body)
	if body.is_in_group("DoorOpener"):
		interactable_activated.emit(body)

func _on_body_exited(body):
	print("body exited: ", body)
	if body.is_in_group("DoorOpener"):
		interactable_deactivated.emit(body)	
