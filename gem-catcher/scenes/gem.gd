extends Area2D

class_name Gem

signal on_gem_off_screen

# adds a property to the inspector
@export var speed: float = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += speed * delta
	
	# check to see if the gem is out of bounds
	if position.y > get_viewport_rect().size.y:
		# stop the process from being further invoked
		set_process(false)
		on_gem_off_screen.emit()
		print('Gem is off of the screen now')
		queue_free()
	
