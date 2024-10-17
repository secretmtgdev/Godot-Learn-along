extends Node2D

# preload the explosion audio
const EXPLODE = preload("res://assets/explode.wav")

@export var gem_scene: PackedScene

@onready var label: Label = $Label
@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

var _score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# create an instance of the gem
func spawn_gem() -> void:
	var new_gem: Gem = gem_scene.instantiate()
	var xpos: float = randf_range(70, 1050)
	new_gem.position = Vector2(xpos, -50)
	new_gem.on_gem_off_screen.connect(game_over)
	
	# add as a child to the game scene and at the top of the viewport
	add_child(new_gem)
	
func stop_all() -> void:
	timer.stop()
	
	# stop all the child nodes
	for child in get_children():
		child.set_process(false)
		
func play_dead() -> void:
	audio_stream_player_2d.stop()
	audio_stream_player_2d.stream = EXPLODE
	audio_stream_player_2d.play()

func game_over() -> void:
	stop_all()
	play_dead()	

func _on_timer_timeout() -> void:
	spawn_gem()

func _on_paddle_area_entered(area: Area2D) -> void:
	_score += 1
	label.text = "%03d" % _score
	audio_stream_player_2d.position = area.position
	audio_stream_player_2d.play()
	area.queue_free()
