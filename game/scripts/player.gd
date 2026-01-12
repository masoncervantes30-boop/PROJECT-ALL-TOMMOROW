extends CharacterBody2D

const SPEED := 220.0

onready var gm = null

func _ready():
    if Engine.has_singleton("GameManager"):
        gm = get_node("/root/GameManager")
    if gm:
        gm.set_moving(get_instance_id(), false)

func _physics_process(delta):
    var dir := Vector2.ZERO
    dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
    dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

    if dir.length() > 0.1:
        velocity = dir.normalized() * SPEED
        if gm:
            gm.set_moving(get_instance_id(), true)
    else:
        velocity = Vector2.ZERO
        if gm:
            gm.set_moving(get_instance_id(), false)

    move_and_slide()
