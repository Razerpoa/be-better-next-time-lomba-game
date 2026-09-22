extends Control

@onready var Menu_Kiri = $VBoxContainer
@onready var Panel_Kanan = $Panelkanan
@onready var Panel_Video = $Panelkanan/IsiVideo
@onready var Panel_Audio = $Panelkanan/IsiAudio
@onready var Panel_Kontrol = $Panelkanan/IsiKontrol

func sembunyikan_semua_panel():
	Panel_Kanan.hide()
	Panel_Video.hide()
	Panel_Audio.hide()
	Panel_Kontrol.hide()
	
func _ready():
	sembunyikan_semua_panel()
	Menu_Kiri.modulate = Color(1.0, 1.0, 1.0, 1.0)

func _on_video_pressed():
	sembunyikan_semua_panel()
	Panel_Kanan.show() 
	Panel_Video.show() 
	Menu_Kiri.modulate = Color(0.4, 0.4, 0.4, 1.0)

func _on_audio_pressed():
	sembunyikan_semua_panel()
	Panel_Kanan.show() 
	Panel_Audio.show() 
	Menu_Kiri.modulate = Color(0.4, 0.4, 0.4, 1.0)

func _on_kontrol_pressed():
	sembunyikan_semua_panel()
	Panel_Kanan.show() 
	Panel_Kontrol.show() 
	Menu_Kiri.modulate = Color(0.4, 0.4, 0.4, 1.0)

func _on_kembali_pressed():
	sembunyikan_semua_panel()
	Menu_Kiri.modulate = Color(1.0, 1.0, 1.0, 1.0)
