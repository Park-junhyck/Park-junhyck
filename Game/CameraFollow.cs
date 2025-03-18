using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public Transform player;      // 플레이어의 Transform
    public Vector3 offset;        // 카메라와 플레이어 간의 오프셋
    public float smoothSpeed = 0.125f;  // 카메라 부드럽게 움직이는 속도

    void LateUpdate()
    {
        // 카메라의 목표 위치를 플레이어 위치 + 오프셋으로 설정
        Vector3 desiredPosition = player.position + offset;
        
        // 부드럽게 카메라가 목표 위치로 이동
        Vector3 smoothedPosition = Vector3.Lerp(transform.position, desiredPosition, smoothSpeed);
        
        // 카메라 위치 설정
        transform.position = smoothedPosition;

        // 카메라가 항상 플레이어를 향하도록 회전
        transform.LookAt(player);
    }
}
