extends Motion_State
const JUMP_VELOCITY = 4.5
@export var ray_cast_3d: RayCast3D
var can_jump: bool

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	print("Entering Jump State")
	pass # Replace with function body.

func exit() -> void:
	print("Exiting Jump State")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(delta: float) -> void:
	parent.velocity.y = JUMP_VELOCITY
	changing_states.emit(self,"fallingstate")
	parent.move_and_slide()
	
