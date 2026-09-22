extends Control

# Karena script ini menempel langsung di Menu_Settings, 
# kita tidak perlu repot-repot mengetikkan "$Menu_Settings/..." lagi!

@onready var menu_kiri = $ColorRect/VBoxContainer
@onready var panel_kanan = $ColorRect/Panelkanan
@onready var panel_video = $ColorRect/Panelkanan/IsiVideo
@onready var panel_audio = $ColorRect/Panelkanan/IsiAudio
@onready var panel_kontrol = $ColorRect/Panelkanan/IsiKontrol

# Referensi ke Menu Utama untuk dimunculkan kembali nanti
@onready var menu_utama = $"../Menu_utama" 

func _ready():
	sembunyikan_semua_panel()
	menu_kiri.modulate = Color(1.0, 1.0, 1.0, 1.0)

func sembunyikan_semua_panel():
	panel_kanan.hide()
	panel_video.hide()
	panel_audio.hide()
	panel_kontrol.hide()

func _on_video_pressed():
	sembunyikan_semua_panel()
	panel_kanan.show()
	panel_video.show()
	menu_kiri.modulate = Color(0.4, 0.4, 0.4, 1.0)

func _on_audio_pressed():
	sembunyikan_semua_panel()
	panel_kanan.show()
	panel_audio.show()
	menu_kiri.modulate = Color(0.4, 0.4, 0.4, 1.0)

func _on_kontrol_pressed():
	sembunyikan_semua_panel()
	panel_kanan.show()
	panel_kontrol.show()
	menu_kiri.modulate = Color(0.4, 0.4, 0.4, 1.0)

func _on_kembali_pressed():
	# Tutup menu setting ini
	hide() 
	# Munculkan lagi menu utama
	menu_utama.show() 
	
	sembunyikan_semua_panel()
	menu_kiri.modulate = Color(1.0, 1.0, 1.0, 1.0)
