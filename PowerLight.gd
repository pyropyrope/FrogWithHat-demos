extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#on area entering the sensor shape
func _on_broad_sensor_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#check if object cares about light
	if check_light_sensitive(area) == true:
		pass
		
#on body entering the sensor shape
func _on_broad_sensor_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#check if object cares about light
	if check_light_sensitive(body) == true:
		print(body)
		print(body.get_center())
		if start_tracking (body, true):
			pass

#checks if object cares about light
func check_light_sensitive(obj):
	#returns false if the object has no light seneitive property (eg. walls, decor)
	if obj.has_method(StringName('is_light_sensitive'))== false:
		return false
	#returns false if light sensitivity turned off
	elif obj.is_light_sensitive() == false:
		return false
	#returns true if light sensitivity present
	elif obj.is_light_sensitive() == true:
		return true

#checks if the function is currently in the light (unobstucted by a shadow casting object)
#takes object and a booleen for if you can see through it
func start_tracking (obj, is_solid):
	var center
	var ray
	
	
