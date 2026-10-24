extends Label


func _ready() -> void:
	print("READY")
	# Connect to the global signal
	Global.score_changed.connect(_on_score_changed)
	# Set initial text
	self.text = "Score: " + str(Global.total_score)

func _on_score_changed(new_score: int) -> void:
	self.text = "Score: " + str(new_score)
