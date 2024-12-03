extends CharacterBody2D

# Constants
const SPEED = 40.0

const ACCL = 1500
const FRICTION = 7000
const INITIAL_FAST = 10

# Variables
var input = Vector2.ZERO
var fast = INITIAL_FAST
var sprite_sheet = load("res://sprite sheets/new.png")

@onready var walk_sprite_b = $body_animation/walk_sprite_sheet
@onready var idle_sprite_b = $body_animation/idle_sprite_sheet
@onready var walk_sprite_h = $head_animation/walk_sprite_sheet
@onready var idle_sprite_h = $head_animation/idle_sprite_sheet
@onready var head = $head_animation
@onready var body = $body_animation
@onready var head_animation = $head_animation/AnimationPlayer
@onready var body_animation = $body_animation/AnimationPlayer


var w = null
var i = null
var anim = null
func _ready():
	
	head._set_sprite_sheet("res://sprite sheets/head_walk_sprite_sheet.png","res://sprite sheets/head_idle_sprite_sheet.png")
	body._set_sprite_sheet("res://sprite sheets/body_walk_sprite_sheet.png","res://sprite sheets/body_idle_sprite_sheet.png")
	
	#texture = ImageTexture.create_from_image(image)
	#get_filesystem_path
	#get_editor_interface().get_resource_filesystem().scan_sources()
	var filepath = "res://sprite sheets/new.png"
	
# Functions
func _physics_process(delta):
	handle_movement(delta)
	move_and_slide()

# Handles player movement
var speed = 0.04


func handle_movement(delta):
	
	input = Input.get_vector("a", "d", "w", "s")
	#print(input)
	
	if input:
		velocity = velocity.move_toward(input * SPEED * fast, delta * ACCL)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, delta * FRICTION)

	if Input.is_action_pressed("shift") and fast < 15:
		fast += 1
		speed = 0.06
	#	print(fast) 
	elif fast > INITIAL_FAST:
		speed = 0.04
		fast -= 1
	
	var deez_input = Vector2(snappedf(input.x, 0.1) ,snappedf(input.y, 0.1))
	
	
	#print(deez_input,input)

	play_directional_animation(deez_input,speed)
	#print(w,i)



var last_dir = "nil"
var deez = true
var walk = false
var anim_num = 0
var prev_input_vector = null
var walk_sprite =null
var idle_sprite = null
var deezs = true
var info = null
var d = 0
func _animate_hb():
	if d == 1:
		d = 0
	else:
		d += 1
	#await get_tree().create_timer(0.1).timeout
	match d:
		0:
			walk_sprite = walk_sprite_b
			idle_sprite = idle_sprite_b
			anim = body_animation
		1:
			walk_sprite = walk_sprite_h
			idle_sprite = idle_sprite_h
			anim = head_animation
	var info = [walk_sprite,idle_sprite,anim]
	return info
func play_directional_animation(input_vector,speed):

	if deez:
		deez = false
		
		idle_sprite =   _animate_hb()[1]
		walk_sprite = _animate_hb()[0]
		anim = _animate_hb()[2]
		anim.speed_scale = speed
		if not input_vector == Vector2(0,0):
			walk = true
			walk_sprite.visible = true
			idle_sprite.visible = false
			
# Match input_vector for animations and sprite flipping
		match input_vector:
			Vector2(0.7, -0.7):  # Up-right
				
				anim.play("up_right")
				walk_sprite.flip_h = false
			Vector2(-0.7, -0.7):  # Up-left
				anim.play("up_right")
				walk_sprite.flip_h = true
			Vector2(-0.7, 0.7):  # Down-left
				anim.play("down_right")
				walk_sprite.flip_h = true
			Vector2(0.7, 0.7):  # Down-right
				anim.play("down_right")
				walk_sprite.flip_h = false
			Vector2(0, -1):  # Up
				anim.play("up")
			Vector2(0, 1):  # Down
				anim.play("down")
			Vector2(-1, 0):  # Left
				anim.play("right")
				walk_sprite.flip_h = true
			Vector2(1, 0):  # Right
				anim.play("right")
				walk_sprite.flip_h = false

		# Match input_vector for last_dir assignment and timer

		

			
			_:
				walk_sprite.visible = false
				idle_sprite.visible = true
				walk = false
				anim.stop()
	
		prev_input_vector = input_vector
		#await get_tree().create_timer(0.1).timeout
		#if not input_vector == prev_input_vector:

		anim.seek(anim_num)
		#print(anim_num)
		if anim_num < 0.7:
			anim_num += speed
		else:
			anim_num = 0
		idle(input_vector)
		#print(last_dir)
		if not walk:
			match last_dir:
				"down_right":
					anim.play("idle_d_r")
					idle_sprite.flip_h = false
				"down_left":
					anim.play("idle_d_r")
					idle_sprite.flip_h = true
				"up_right":
					anim.play("idle_u_r")
					idle_sprite.flip_h = false
				"up_left":
					anim.play("idle_u_r")
					idle_sprite.flip_h = true
				"down":
					anim.play("idle_d")
				"up":
					anim.play("idle_u")
				"right":
					anim.play("idle_r")
					idle_sprite.flip_h = false
				"left":
					anim.play("idle_r")
					idle_sprite.flip_h = true
			

		await get_tree().create_timer(0.05).timeout
		deez = true
func idle(input_vector):
	var tim = 0.5
	match input_vector:
		Vector2(0.7, -0.7):  # Up-right
			last_dir = "up_right"
			await get_tree().create_timer(tim).timeout
		Vector2(-0.7, -0.7):  # Up-left
			last_dir = "up_left"
			await get_tree().create_timer(tim).timeout
		Vector2(-0.7, 0.7):  # Down-left
			last_dir = "down_left"
			await get_tree().create_timer(tim).timeout
		Vector2(0.7, 0.7):  # Down-right
			last_dir = "down_right"
			await get_tree().create_timer(tim).timeout
		Vector2(0, -1):  # Up
			last_dir = "up"
			await get_tree().create_timer(tim).timeout
		Vector2(0, 1):  # Down
			last_dir = "down"
			await get_tree().create_timer(tim).timeout
		Vector2(-1, 0):  # Left
			last_dir = "left"
			await get_tree().create_timer(tim).timeout
		Vector2(1, 0):  # Right
			last_dir = "right"
			await get_tree().create_timer(tim).timeout
