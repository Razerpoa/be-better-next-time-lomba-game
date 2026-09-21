extends CharacterBody3D

@export var SPEED: float = 5.0
@export var JUMP_VELOCITY: float = 4.5
@export var MOUSE_SENSITIVITY: float = 0.002
@onready var ray = $Head/RayCast3D
@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D
@onready var InteractUi = $PlayerUi/Interact
@onready var DialogUi = $PlayerUi/WadahDialog

var cantMove: bool = true
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func _unhandled_input(event: InputEvent) -> void:
	# Toggle mouse pake tombol ESC
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	# Kalau kursor lagi lepas, klik kiri layar buat ngunci kursor lagi
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

	# Pergerakan kamera (cuma jalan pas kursor ter-capture)
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		head.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89.0), deg_to_rad(89.0))

func DialogNpc():
	DialogUi.show()
	var Name = $PlayerUi/WadahDialog/PanelNama/NamaKarakter
	var Dialog = $PlayerUi/WadahDialog/PanelUtama/Percakapan
	Name.text = "ucok Ngocok"
	Dialog.text = "Yo Bro, Ini lagi dalam pengembangan Tinggal Kan Jejak"

func _physics_process(delta: float) -> void:
	#Test Area
	
	if Input.is_action_just_pressed("InteractUi") and not cantMove:
		cantMove = true
		DialogUi.hide()
	
	if ray.is_colliding():
		var collider = ray.get_collider()
		if collider and collider.name == "Npc" and cantMove:
			print(cantMove)
			InteractUi.show()
			if Input.is_action_just_pressed("InteractUi"):
				DialogNpc()
				cantMove = false
	else:
		InteractUi.hide()
		
	if not is_on_floor():
		velocity.y -= gravity * delta

	var input_dir := Input.get_vector("kiri", "kanan", "maju", "mundur")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	if direction and cantMove:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
