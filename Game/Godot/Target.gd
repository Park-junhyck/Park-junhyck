extends KinematicBody

var speed = 100
var target : Node2D  # 플레이어를 타겟으로 설정

func _ready():
    target = get_node("/root/Player")  # 플레이어를 추적하도록 설정

func _process(delta):
    var direction = target.position - position
    direction = direction.normalized()
    move_and_slide(direction * speed)
