extends RayCast2D
var target_object
var target_pos



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	if target_object != null:
		update_target_pos()
		pass
	print(self)
	print(target_object == get_collider())

func setup(solid):
	target_object = solid
	

func update_target_pos ():
	target_position = target_object.get_center() - global_position
	
