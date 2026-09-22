extends Control

@onready var label_peringatan: Label = $Label
@onready var menu_utama: Control = $Menu_utama
@onready var menu_settings: Control = $Menu_Settings # Tambahan referensi Settings

var mainVisible: bool
var toggleCamera: bool
var tween: Tween

func _ready() -> void:
	# 1. Atur kondisi awal
	label_peringatan.modulate.a = 0.0
	label_peringatan.visible = true
	
	menu_utama.visible = false
	menu_utama.modulate.a = 0.0
	
	# Pastikan setting mati saat efek teks peringatan berjalan
	menu_settings.visible = false 

	# 2. Buat animasi berurutan menggunakan Tween
	tween = create_tween()
	
	# STEP 1: Fade IN tulisan peringatan
	tween.tween_property(label_peringatan, "modulate:a", 1.0, 1.0)
	
	# STEP 2: Jeda waktu
	tween.tween_interval(2.5)
	
	# STEP 3: Fade OUT tulisan peringatan
	tween.tween_property(label_peringatan, "modulate:a", 0.0, 1.0)
	
	tween.tween_callback(func():
		label_peringatan.visible = false
		menu_utama.visible = true
	)
	
	# STEP 4: Fade IN menu utama
	tween.tween_property(menu_utama, "modulate:a", 1.0, 0.8)

# _input catches events BEFORE any GUI Control node consumes them
func _input(event: InputEvent) -> void:
	if tween and tween.is_running() and event.is_pressed():
		if event is InputEventKey or event is InputEventMouseButton or event is InputEventJoypadButton or event is InputEventScreenTouch:
			tween.custom_step(999.0)
			# Stop the event from triggering buttons on the main menu on the same frame
			get_viewport().set_input_as_handled()

func _on_new_game_pressed() -> void:
	toggleCamera = !toggleCamera
	mainVisible = true
	visible = false

# --- FUNGSI UNTUK MENGGANTI LAYAR KE SETTINGS ---
func _on_settings_pressed() -> void:
	menu_utama.visible = false
	menu_settings.visible = true


func _on_load_game_pressed() -> void:
	pass # Replace with function body.
