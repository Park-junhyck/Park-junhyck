using UnityEngine;

public class PlayerMovement3D : MonoBehaviour
{
    public float moveSpeed = 5f;          // 이동 속도
    public float rotationSpeed = 700f;    // 회전 속도
    private CharacterController controller;  // CharacterController 참조

    private Vector3 moveDirection;        // 이동 방향
    private float gravity = -9.8f;        // 중력

    void Start()
    {
        controller = GetComponent<CharacterController>();  // CharacterController 가져오기
    }

    void Update()
    {
        // 입력받은 값으로 이동 방향 계산
        float moveX = Input.GetAxis("Horizontal");  // 좌우 입력 (A, D or Arrow Left/Right)
        float moveZ = Input.GetAxis("Vertical");    // 상하 입력 (W, S or Arrow Up/Down)

        // 이동 방향 설정
        moveDirection = new Vector3(moveX, 0, moveZ).normalized;

        // Y축(중력) 처리를 추가
        if (!controller.isGrounded)
        {
            moveDirection.y += gravity * Time.deltaTime;  // 공중에 있을 경우 중력 적용
        }
        else
        {
            moveDirection.y = 0;  // 바닥에 있을 경우 Y축 움직임 초기화
        }

        // 이동 처리
        controller.Move(moveDirection * moveSpeed * Time.deltaTime);  // 이동

        // 플레이어 회전 처리 (마우스나 키보드 방향에 맞춰 회전)
        if (moveDirection.magnitude > 0)
        {
            // 이동 방향에 맞춰 회전
            Quaternion toRotation = Quaternion.LookRotation(moveDirection, Vector3.up);
            transform.rotation = Quaternion.RotateTowards(transform.rotation, toRotation, rotationSpeed * Time.deltaTime);
        }
    }
}
