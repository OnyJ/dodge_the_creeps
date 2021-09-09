extends CanvasLayer
# HUD means Head-up display

signal start_game
signal options


func update_score(score):
	$ScoreLabel.text = str(score)


func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Dodge The Creeps"
	$MessageLabel.show()
	yield(get_tree().create_timer(1.0), "timeout")
	$StartButton.show()
	$OptionsButton.show()


func _on_StartButton_pressed():
	$StartButton.hide()
	$OptionsButton.hide()
	emit_signal("start_game")


func _on_MessageTimer_timeout():
	$MessageLabel.hide()


# Options Button

func show_options():
	# show Controls
	# -> move, start/pause, mute
	# show SelectDifficulty (1/2/3)
	# show BackButton
	pass

func show_start_menu():
	$ScoreLabel.show()
	$MessageLabel.show()
	$StartButton.show()


func hide_start_menu():
	# hide messages and buttons
	$ScoreLabel.hide()
	$MessageLabel.hide()
	$StartButton.hide()
	pass


func switch_options_view():
	if $OptionsButton.text == "Options":
		hide_start_menu()
		$OptionsButton.text = "Back"
	
	elif $OptionsButton.text == "Back":
		show_start_menu()
		$OptionsButton.text = "Options"


func _on_OptionsButton_pressed():
	switch_options_view()
