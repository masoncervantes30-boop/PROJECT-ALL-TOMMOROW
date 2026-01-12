extends Node

# Tracks mover state (instance_id -> bool)
var movers := {}

func _ready():
    pass

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
