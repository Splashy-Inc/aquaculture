extends Timer

@export var audio_stream_player_2D: AudioStreamPlayer2D


func _on_timeout() -> void:
	if randi() % 10 == 0:
		audio_stream_player_2D.play()
