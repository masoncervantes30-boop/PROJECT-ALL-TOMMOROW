Godot 4 prototype — top-down (Hotline-style) MVP A

Overview
- Engine: Godot 4 (GDScript)
- Scope: Player movement (WASD/arrow keys), one patrolling enemy, and a "fusion" mechanic where enemies blend into the snow-fuzz background when movement stops.
- This is a *prototype* with placeholder visuals and a simple shader to give a snow-fuzz background and subtle enemy reveal.

How to open
1. Install Godot 4 (latest stable). 2. Open this folder (`game/`) as a project in Godot.
2. Setup (optional): add `GameManager.gd` as an Autoload with the name `GameManager` (in Project > Project Settings > Autoload, set path `res://scripts/GameManager.gd` name `GameManager`).

Controls
- Move: WASD / Arrow keys
- Reveal fused enemies (debug): press `R` (toggle)

Files added
- `scenes/Main.tscn` — root scene
- `scenes/Player.tscn` — player node (CharacterBody2D)
- `scenes/Enemy.tscn` — enemy with patrol and fuse/unfuse logic
- `scripts/GameManager.gd` — tracks moving entities and exposes `is_all_stopped()`
- `scripts/player.gd` — handles input & notifies GameManager about movement
- `scripts/enemy.gd` — patrol and fuse/unfuse behavior; uses a shader uniform to reveal subtle visibility while moving
- `shaders/snow_fuzz.shader` — a simple canvas shader that produces a noisy snow-like background

Notes & next steps
- Replace placeholder sprites with your rotoscoped frames later. Enemy shader provides a subtle reveal so humans can see moving enemies.
- I left `GameManager` as an autoload (not automatically registered) — follow the steps above to enable it in your Godot editor.
