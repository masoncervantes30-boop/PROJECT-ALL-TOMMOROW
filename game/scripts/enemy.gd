extends CharacterBody2D

@export var patrol_distance := 120.0
@export var speed := 80.0

var start_pos := Vector2.ZERO
var dir := 1
var fused := false
var debug_reveal := false
onready var sprite := $Sprite
onready var gm = null

func _ready():
    start_pos = global_position
    if Engine.has_singleton("GameManager"):
        gm = get_node("/root/GameManager")
    if gm:
        gm.set_moving(get_instance_id(), false)

func _physics_process(delta):
    # simple patrol
    var target_x = start_pos.x + patrol_distance * dir
    var velocity_local = Vector2.ZERO
    if abs(global_position.x - target_x) > 4:
        var move_dir = sign(target_x - global_position.x)
        velocity_local.x = move_dir * speed
        move_and_slide()
        if gm:
            gm.set_moving(get_instance_id(), true)
    else:
        dir *= -1
        if gm:
            gm.set_moving(get_instance_id(), false)

    # Fusion check
    if gm and gm.is_all_stopped() and not fused:
        _fuse()
    elif gm and not gm.is_all_stopped() and fused:
        _unfuse()

    # debug reveal toggle (press R or action)
    if Input.is_action_just_pressed("reveal"):
        debug_reveal = not debug_reveal
        _apply_reveal(debug_reveal)

func _fuse():
    fused = true
    # fade out
    var t = create_tween()
    t.tween_property(sprite, "modulate:a", 0.02, 0.5)
    # disable collisions
    $CollisionShape2D.disabled = true

func _unfuse():
    fused = false
    var t = create_tween()
    t.tween_property(sprite, "modulate:a", 1.0, 0.3)
    $CollisionShape2D.disabled = false

func _apply_reveal(on):
    if on:
        sprite.modulate = Color(1, 0.5, 0.5, 1)
    else:
        sprite.modulate = Color(0.6, 0.6, 0.65, 1)

func _exit_tree():
    if gm:
        gm.unregister(get_instance_id())
