extends Node2D

var current_question_index: int
var question: Label
var answer_labels: Array[Label]

func _ready() -> void:
	question = $Control/Question
	answer_labels = [$Control/Answer1, $Control/Answer2, $Control/Answer3]
	current_question_index = 0
	handle_questions()
	update_score()
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("upArrow"):
		current_question_index += 1
		Globals.score += 1
		handle_questions()
	elif Input.is_action_just_pressed("downArrow"):
		current_question_index -= 1
		if current_question_index < 0:
			current_question_index = 0
		handle_questions()

func update_score() -> void:
	$Control/Score.text = "Score: " + str(Globals.score)

func handle_questions() -> void:
	print(current_question_index)
	if current_question_index == 0:
		question.text = "Which data type is used to create a variable that should store text?"
		answer_labels[0].text = "string"
		answer_labels[1].text = "str"
		answer_labels[2].text = "txt"
	elif current_question_index == 1:
		question.text = "How do you create a variable with the numeric value 5?"
		answer_labels[0].text = "x = 5"
		answer_labels[1].text = "num x = 5"
		answer_labels[2].text = "int x = 5;"
	elif current_question_index == 2:
		question.text = "How do you create a variable with the floating number 2.8?"
		answer_labels[0].text = "byte x = 2.8"
		answer_labels[1].text = "double x = 2.8d;"
		answer_labels[2].text = "int x = 2.8d;"

func _on_exit_area_1_body_entered(body: Node2D) -> void:
	if body.name == "2D_Lucyna":
		if current_question_index == 0:
			Globals.score += 1
			update_score()
			current_question_index += 1
			handle_questions()
			$"2D_Lucyna".position = Vector2(90, 500)
		else:
			$"2D_Lucyna".position = Vector2(90, 500)

func _on_exit_area_2_body_entered(body: Node2D) -> void:
	if body.name == "2D_Lucyna":
		if current_question_index == 2:
			Globals.score += 1
			update_score()
			current_question_index += 1
			handle_questions()
			$"2D_Lucyna".position = Vector2(90, 500)
		else:
			$"2D_Lucyna".position = Vector2(90, 500)

func _on_exit_area_3_body_entered(body: Node2D) -> void:
	if body.name == "2D_Lucyna":
		if current_question_index == 1:
			Globals.score += 1
			update_score()
			current_question_index += 1
			handle_questions()
			$"2D_Lucyna".position = Vector2(90, 500)
		else:
			$"2D_Lucyna".position = Vector2(90, 500)
