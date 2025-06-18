package com.kh.condition;

import java.util.Scanner;

public class C_For {
	Scanner sc =  new Scanner(System.in);
	/*
	 * for문
	 * 
	 * for(초기식; 조건식; 증감식) {
	 * 	실행코드
	 * }
	 * 
	 * 주어진 횟수만큼 코드를 반복실행하는 구문
	 * - 초기식 : 반복문이 수행될 때 단 한 번만 실행, 반복문 안에서 사용할 변수를 선언하고 초기값 대입
	 * 조건식 : 결과가 ture이면 실행 코드를 실행, false인 경우면 실행하지 않고 반복문을 빠져나감
	 * - 증감식 : 반복문에서 사용하는 변수의 값을 증감, 주로 증감 연산자 사용
	 * 
	 * */
	// 1 ~ 5 출력
	public void method1() {
		for(int i = 1; i <= 5; i++) {
			System.out.println(i);
		}
	}
		
	public void method2() {
		for(int i = 5; i >= 1; i-- ) {
			System.out.println(i);
		}
	}
	
	public void method3() {
		
		for(int i = 1; i <= 10; i+=2) {
		System.out.println(i);
			
		}
		System.out.println("------");
		
		for(int i = 1; i <= 10; i++) {
			if(i % 2 != 0) 
			System.out.println(i);
				
			}
		System.out.println("------");
		
		/*
		 * continue 문
		 * - continue문은 반복문 안에서 사용
		 * - 반복문 안에서 continue를 만나면 "현제 구문" 종료
		 * - 반복문을 빠져나가는 건 아님! 다음 반복 계속 수행
		 * */
		
		for(int i = 1; i <= 10; i++) {
			if(i % 2 == 0) continue;
			System.out.println(i);
				
			}
	
		
		
	}
	
	//1 ~ 10  까지의 합계
	public void method4( ) {
		int sum = 0;
		for (int i = 1; i <=  10; i++) {
			sum = sum + 1;
			System.out.println(sum);
		}
	}
	
	
	public static void main(String[] args) {
		C_For c = new C_For();
		// c.method1();
		// c.method2();
		// c.method3();
		c.method4();
	}

}
