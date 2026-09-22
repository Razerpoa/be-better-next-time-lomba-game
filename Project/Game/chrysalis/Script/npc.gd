extends CharacterBody3D

@onready var AnimationPlaer = $Main/AnimationPlayer

func _ready() -> void:
	AnimationPlaer.play("Main|Idle Breathing")

func _physics_process(delta: float) -> void:
	var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
	if not is_on_floor():
		velocity.y -= gravity * delta
	move_and_slide()
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "Player":
		AnimationPlaer.play("Main|Talking")
	
	pass # Replace with function body.


func _on_area_3d_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		AnimationPlaer.play("Main|Idle Breathing_001")
	pass # Replace with function body.
