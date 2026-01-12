extends Node

# Tracks mover state (instance_id -> bool)
var movers := {}

func _ready():
    # Ensure the 'reveal' input action exists so debug toggle works
    if not InputMap.has_action("reveal"):
        InputMap.add_action("reveal")
        var ev := InputEventKey.new()
        ev.keycode = Key.R
        InputMap.action_add_event("reveal", ev)

func set_moving(id: int, moving: bool) -> void:
    movers[id] = moving

func unregister(id: int) -> void:
    if movers.has(id):
        movers.erase(id)

func is_all_stopped() -> bool:
    for m in movers.values():
        if m:
            return false
    return true
