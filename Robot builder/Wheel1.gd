extends RigidBody2D

var bot 
var placed = false
var speed = 150
var connecter 
var broken = false
# Called when the node enters the scene tree for the first time.
func _ready():
	bot = get_tree().current_scene.get_node("Robot body")
	connecter = bot.get_node("Front wheel joint")
	$CollisionShape2D.disabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("left"):
		if linear_velocity.x > -speed:
			linear_velocity.x -= 1
	
	if Input.is_action_pressed("right"):
		if linear_velocity.x < speed:
			linear_velocity.x += 1
	# Break off if linear velocity is above force.
	if abs(linear_velocity.x) > connecter.strength or abs(linear_velocity.y/4) > connecter.strength and not broken:
		broken = true
		connecter.node_b = ""
		print(linear_velocity)

