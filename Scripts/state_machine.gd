extends Node

@export var starting_state: State
var states = {}
var current_state: State

func init(parent_node: CharacterBody3D) -> void:
	for state in get_children():
		if state is State:
			state.parent = parent_node
			states[state.name.to_lower()] = state
			state.changing_states.connect(change_state)
			print(state, state.parent)
	current_state = starting_state
	current_state.enter()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process(delta: float) -> void:
	current_state.process(delta)
	pass
	
func physics_process(delta: float) -> void:
	current_state.physics_process(delta)
	pass

func input(event: InputEvent) -> void:
	current_state.motion_input(event)
	current_state.input(event)
	pass
	
func change_state(state, new_state):
	if state != current_state:
		return
	if new_state:
		current_state.exit()
		current_state = states[new_state]
		current_state.enter()
	pass
