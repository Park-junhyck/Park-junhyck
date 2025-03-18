extends KinematicBody2D

var speed = 200
var velocity = Vector2()

func _ready():
    pass

func _process(delta):
    velocity = Vector2()

    # 입력 처리 (WASD or 방향키)
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1

    # 속도 설정
    velocity = velocity.normalized() * speed

    # 이동
    move_and_slide(velocity)
