extends Area2D
@export var light_sensitive = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func is_light_sensitive():
	return light_sensitive

func get_center():
	return $AreaObjectCollisionShape2D.global_position
