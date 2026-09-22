extends Control

# Ini adalah variabel yang dibaca oleh _process di Node3D
var mainVisible: bool = false 

@onready var menu_utama = $Menu_utama

func _ready():
	show()
	menu_utama.show()

# --- HUBUNGKAN SINYAL TOMBOL NEW GAME KE SINI ---
func _on_new_game_pressed():
	# Mengubah status menjadi true agar dunia game muncul
	mainVisible = true 
	
	# Sembunyikan layar menu utama agar tidak menutupi game
	hide()
	
