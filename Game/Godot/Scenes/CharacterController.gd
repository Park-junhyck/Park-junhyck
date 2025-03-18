extends KinematicBody

# 변수 선언
var speed = 200
var velocity = Vector3()
var rotation_speed = 5

# 이동 처리
func _process(delta):
    var direction = Vector3() # 이동 방향을 저장할 변수
    
    if Input.is_action_pressed("ui_right"):
        direction.x += 1
    if Input.is_action_pressed("ui_left"):
        direction.x -= 1
    if Input.is_action_pressed("ui_down"):
        direction.z += 1
    if Input.is_action_pressed("ui_up"):
        direction.z -= 1

    # 속도 및 방향 설정
    direction = direction.normalized() * speed
    velocity = direction

    # 이동 처리
    move_and_slide(velocity, Vector3.UP)

    # 애니메이션 설정 (걷기 등)
    if direction.length() > 0:
        $AnimationPlayer.play("walk")
    else:
        $AnimationPlayer.play("idle")
