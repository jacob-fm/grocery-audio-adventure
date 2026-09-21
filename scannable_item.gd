extends StaticBody3D

var highlight_material: StandardMaterial3D
var currently_highlighted: bool = false

@onready var audio: AudioStreamPlayer3D = $AudioStreamPlayer3D

func _ready():
	highlight_material = StandardMaterial3D.new()
	highlight_material.albedo_color = Color(1.0, 1.0, 0.2)
	highlight_material.emission_enabled = true
	highlight_material.emission = Color(1.0, 1.0, 0.2)
	highlight_material.emission_energy_multiplier = 2.0

func set_highlighted(highlighted: bool):
	var mesh = $MeshInstance3D

	if highlighted:
		currently_highlighted = true
		mesh.material_overlay = highlight_material
	else:
		currently_highlighted = false
		mesh.material_overlay = null

func _on_character_body_3d_interaction_attempted():
	if currently_highlighted:
		audio.play()
