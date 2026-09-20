extends Node3D

@onready var MainUi = $MainMenuManeger
var mainVisible: bool
@onready var MainNode = $Playing
@onready var player = $Playing/Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	MainNode.visible = MainUi.mainVisible
	if player.position.y <= -5:
		player.position = Vector3(0, 3, 0)
	pass
