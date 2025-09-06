extends State
class_name Motion_State

const SPEED = 5.0
const SENSITIVITY = .003
const BOB_FREQUENCY = 2.0
const BOB_AMP =0.08
var bobbing

func motion_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		parent.camera_mount.rotate_y(-event.relative.x * SENSITIVITY)
		parent.camera_3d.rotate_x(-event.relative.y * SENSITIVITY)
		parent.camera_3d.rotation.x = clamp(parent.camera_3d.rotation.x, deg_to_rad(-40), deg_to_rad(60))
	pass
