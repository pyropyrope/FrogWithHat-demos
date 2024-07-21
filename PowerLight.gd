extends Node2D

@export var ray_for_solids: PackedScene
@export var speed = 250

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)

#on area entering the sensor shape
func _on_broad_sensor_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	#check if object cares about light
	if check_light_sensitive(area) == true:
		pass
		
#on body entering the sensor shape
func _on_broad_sensor_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	#check if object cares about light
	if check_light_sensitive(body) == true:
		start_tracking (body, true)


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

#creates a tracking ray of appropriate type for given object

#takes object and a booleen for if you can see through it
func start_tracking (obj, is_solid):
	#checks if object is "solid"
	if is_solid == true:
		#creates a solids ray
		var ray = ray_for_solids.instantiate()
		#passes new ray the object
		ray.setup(obj)
		#adds to the tracking rays node
		$TrackingRays.add_child(ray)
		$TrackingRays.add_to_dict(obj,ray)
		
	
	
func move(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta


func _on_broad_sensor_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	$TrackingRays.delete(body)
