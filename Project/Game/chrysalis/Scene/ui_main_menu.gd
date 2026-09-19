extends Control

@onready var label_peringatan: Label = $Label
@onready var menu_utama: Control = $Menu_utama

func _ready() -> void:
	# 1. Atur kondisi awal: sembunyikan semua elemen (Alpha / transparansi = 0)
	label_peringatan.modulate.a = 0.0
	menu_utama.visible = false
	menu_utama.modulate.a = 0.0

	# 2. Buat animasi berurutan menggunakan Tween
	var tween = create_tween()
	
	# STEP 1: Fade IN tulisan peringatan (durasi 1.0 detik)
	tween.tween_property(label_peringatan, "modulate:a", 1.0, 1.0)
	
	# STEP 2: Jeda waktu agar pemain sempat membaca (diam selama 2.5 detik)
	tween.tween_interval(2.5)
	
	# STEP 3: Fade OUT tulisan peringatan (durasi 1.0 detik)
	tween.tween_property(label_peringatan, "modulate:a", 0.0, 1.0)
	
	# STEP 4: Matikan label peringatan & aktifkan wadah Menu Utama
	tween.tween_callback(func():
		label_peringatan.visible = false
		menu_utama.visible = true
	)
	
	# STEP 5: Fade IN Menu Utama (durasi 0.8 detik)
	tween.tween_property(menu_utama, "modulate:a", 1.0, 0.8)
