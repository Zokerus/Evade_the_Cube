extends Control

var m_hp : int = 0

@onready var health_points = $MarginContainer/VBoxContainer/HBoxContainer/Label2

func update_health(hp : int) -> void:
	m_hp = hp
	health_points.text = str(m_hp)
