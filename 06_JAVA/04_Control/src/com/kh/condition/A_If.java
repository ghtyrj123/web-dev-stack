package com.kh.condition;

import java.util.Scanner;

public class A_If {
	
	Scanner sc =new Scanner(System.in);
	
	public void method1() {
		
		/*
		 * if문
		 * 
		 * if{조건식} {
		 * 		조건식이 참 (true)일 때 실행
		 * } else
		 * 	조건식이 false 일때 실행
		 * 보통 조건식에는 비교연산자, 논리연산자를 주로 사용
		 * */
		
		
		// 입력받은 성적이 60점 이상이면 "합격입니다" 출력
		// 아니면 "불합격입니다" 출력
		// 1줄일 경우에만 중괄호 ({}) 생략 가능
		System.out.println("점수를 입력해라 >");
		int num = sc.nextInt();
		if (num >= 60) {
			System.out.println("합격입니다.");
		}
		else System.out.println("불합격임 다시 도전해라");
		
		// 삼향연산자
		System.out.println(num >= 60 ? "합격입니다" : "불합격입니다");
	}
	
	public void method2() {
		//본인의 이름을 입력했을  때 본인이면 "본인이다", 아니면 "본인이 아니다" 츨력
		
		System.out.println("이름을 입력하시오");
		String name = sc.nextLine();
		if (name.equals("장효준")) {
			System.out.println("본인이다!~");
		} else {
			System.out.println("본인이 아니다");
		}
		
		/*
		 * if - else if - else 문
		 * 
		 * if (조건식) {
		 * 		조건식이 1이 참 (true)일 때 실행
		 * } else if (조건식2) {
		 * 		조건식1이 거짓(false)이면서 조건식2이 참(ture)일 때 실행
		 * } else {
		 * 		조건식1, 2 모두 거짓(false) 일 때 실행
		 * }
		 * 
		 * 
		 * - else if는 추가 제한이 없습니다.
		 * */
		
		
		/*
		 * 사용자에게 점수(0 ~ 100) 를 입력 받아서 점수별로 등급 부여
		 * - 90점 이상은 A 등급
		 * - 90점 미만 80점 이상은 B등급
		 * - 80점 미만 70점 이상은 B등급
		 * - 70점 미만 60점 이상은 B등급
		 * - 60점 미만은 F등급
		 * 
		 * */
		
	
		
		
		
		
		
		
		
	}
	public void method3() {
		System.out.println("점수를 입력하시오");
		int num = sc.nextInt();
		char grade = '\u0000';
		
		if (num < 0 || num > 100) {
			System.out.println("잘못함"); return;
		}
		else if (num >= 90) grade = 'A';
		else if (num >= 80) grade = 'B';
		else if (num >= 70) grade = 'C';
				else if (num >= 60) grade = 'D';
				else  grade = 'F';
		
		
		
		
	
	
}

public void method4() {
	/*
	 * 새 정수를 입력했를때 짝수만 출력
	 * 
	 * num1 입력 : 3
	 * num1 입력 : 4
	 * num1 입력 : 8
	 * 
	 * */
	System.out.println("정수1 입력");
	int num1 = sc.nextInt();
	
	System.out.println("정수2 입력");
	int num2 = sc.nextInt();
	
	System.out.println("정수3 입력");
	int num3 = sc.nextInt();
	
	if (num1 % 2 == 0)
		System.out.println(num1);
	if (num2 % 2 == 0)
		System.out.println(num2);
	if (num3 % 2 == 0)
		System.out.println(num3);
	
	
	
	
	
	
	
}

	


	
	
		

	public static void main(String[] args) {
		A_If a =new A_If();
		//a.method1();
		//a.method2();
		//a.method3();
		a.method4();
	}

}
