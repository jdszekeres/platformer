extends Area2D

func _ready() -> void:
	# This forces the signal to connect via code just in case the editor connection broke
	body_entered.connect(_on_body_entered)
func _on_body_entered(_body: Node2D) -> void:

	Global.add_score(10)
	queue_free() # Removes the collectible from the game
