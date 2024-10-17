extends Area2D

@export var speed: float = 500.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction: float = Input.get_axis("left", "right")
	position.x += direction * speed * delta

# Something has collided with the paddle
