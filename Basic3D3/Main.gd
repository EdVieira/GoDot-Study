extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	$Panel.hide()

func _process(delta):
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().reload_current_scene()


func _on_Area_body_entered(body):
	if body is RigidBody:
		$Panel.show()
