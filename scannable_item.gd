extends StaticBody3D

var highlight_material: StandardMaterial3D
var currently_highlighted: bool = false

@export var audio_stream: AudioStream
@export var highlight_color: Color

@onready var audio_player: AudioStreamPlayer3D = $AudioStreamPlayer3D

func _ready():
	highlight_material = StandardMaterial3D.new()
	highlight_material.albedo_color = highlight_color
	highlight_material.emission_enabled = true
	highlight_material.emission = highlight_color
	highlight_material.emission_energy_multiplier = 2.0

	audio_player.stream = audio_stream

func set_highlighted(highlighted: bool):
	var mesh = $MeshInstance3D

	if highlighted:
		currently_highlighted = true
		mesh.material_overlay = highlight_material
	else:
		currently_highlighted = false
		mesh.material_overlay = null

func play_audio():
	if currently_highlighted:
		print("INTERACTED WITH: ", name)
		print("Audio stream: ", audio_player.stream)
		audio_player.play()
