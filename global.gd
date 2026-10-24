extends Node

signal score_changed(new_score: int) # Emits whenever the score changes

var total_score: int = 0

func add_score(amount: int) -> void:
	print("Adding score")
	total_score += amount
	score_changed.emit(total_score) # Notify the UI
func set_score(amount: int) -> void:
	print("Chaing score to "+str(amount))
	total_score = amount
	score_changed.emit(total_score)
