extends CharacterBody3D

@onready var state_machine: Node = $StateMachine
@onready var camera_mount: Node3D = $CameraMount
@onready var camera_3d: Camera3D = $CameraMount/Camera3D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	state_machine.init(self)
	
func _physics_process(delta: float) -> void:
	state_machine.physics_process(delta)
	
func _process(delta: float) -> void:
	state_machine.process(delta)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Focus"):
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("Unfocus"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	state_machine.input(event)
	
func _input(event: InputEvent) -> void:
	state_machine.input(event)
