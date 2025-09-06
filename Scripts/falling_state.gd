extends Motion_State

func enter() -> void:
	print("Entering Falling State")
	pass # Replace with function body.

func exit() -> void:
	print("Exiting Falling State")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(delta: float) -> void:
	parent.velocity += parent.get_gravity() * delta
	if parent.velocity.y <= 0 && parent.is_on_floor():
		parent.velocity = Vector3.ZERO
		changing_states.emit(self,"walkingstate")
	var input_dir := Input.get_vector("Walk Left", "Walk Right", "Walk Forward", "Walk Backwards")
	var direction : Vector3 = (parent.camera_mount.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		parent.velocity.x = direction.x * SPEED
		parent.velocity.z = direction.z * SPEED

	parent.move_and_slide()
