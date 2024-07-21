extends RayCast2D
var target_object



# Called when the node enters the scene tree for the first time.
#allows collision with areas
func _ready():
	collide_with_areas = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	if target_object != null:
		update_target_pos()
		update_exceptions()
	
func setup(area):
	target_object = area
	

func update_target_pos ():
	target_position = to_local(target_object.get_center())
	

func check_lit():
	if get_collider() == target_object:
		return true
	else:
		return false

func update_exceptions():
	if get_collider() == target_object:
		pass
	elif get_collider() != target_object:
		if str(get_collider()).contains("Area"):
			add_exception(get_collider())
