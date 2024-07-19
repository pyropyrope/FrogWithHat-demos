extends CharacterBody2D
@export var speed = 400
var screen_size
var bit_map = load("res://assets/wizard/A_Wizard.bmp")


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	#setting up screen size
	screen_size = get_viewport_rect().size
	var vector_array = make_polygons(bit_map)
	$WizardCollision.set_polygon(vector_array)
	var oc_poly = make_occluder_poly(vector_array)
	$WizardOccluder2D.occluder = oc_poly


func get_input():
	#8 way movement
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()

func make_polygons(bm):
	#create empty array
	var vectors = PackedVector2Array()
	#run opaque_to_polygons method for bitmaps
	vectors = bm.opaque_to_polygons(Rect2(Vector2(), bit_map.get_size()),1.0)
	#test line
	print(vectors)
	return vectors[0]

func make_occluder_poly(va):
	#create empty new occluder polygon
	var occluder_polygon = OccluderPolygon2D.new()
	#set the polygon to the vector array
	occluder_polygon.set_polygon(va)
	return (occluder_polygon)
