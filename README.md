# TextFieldProject
## TextField와 Delegation pattern 이해
## 개요
TextField사용을 통한 델리게이트 패턴 
TextField <--> ViewController 간의 의사소통

TextField에서 유저와의 커뮤니케이션이 이루어지고 ViewController로 전달

Deligation : 위임 
textField.delegate = self 로 VC에 위임한것. 
객체간 쌍방향 커뮤니케이션 가능 


UITextFieldDelegate 프로토콜 채택하여 함수 구현 및 사용.
