extends Motion_State

func enter() -> void:
	print("Entered Idle")

func exit() -> void:
	print("Left Idle")

func input(event) -> void:
	if event.is_action_pressed("Jump") and parent.is_on_floor():
		print("Jumped")
		changing_states.emit(self,"jumpingstate")
	if event.is_action_pressed("Walk Forward") or event.is_action_pressed("Walk Backwards") or event.is_action_pressed("Walk Left") or event.is_action_pressed("Walk Right"):
		changing_states.emit(self, "walkingstate")
	pass

func physics_process(delta: float) -> void:
	if not parent.is_on_floor():
		parent.velocity += parent.get_gravity() * delta
	parent.move_and_slide()
