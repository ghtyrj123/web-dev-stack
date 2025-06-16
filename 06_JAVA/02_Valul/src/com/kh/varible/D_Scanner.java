package com.kh.varible;

import java.util.Scanner;

public class D_Scanner {
	
	/*
	 * Scanner
	 * - 화면(콘솔)에서 데이터를 "입력: 받는 클래스
	 * 
	 * 1. import java.util.Scanner; 추가
	 * 
	 * 2. Scanner 객체 생성
	 * 	Scanner SC =new Scanner(System.ln);
	 * 3. Scanner 매서드 사용
	 * 		입력값이
	 * - 문자열일 때 : sc.next() - 공백 있을 경우 공백 이전까지
	 * 		sc.nextlLine() - 공백 포함 앤터 전까지
	 * 		- 정수일 떄 : sc.nextint()
	 * 		- 실수일 때 : sc.nextFloat(), sc.nextDouble()
	 * 
	 * 	=> 권장하기는 sc.nextLine()만 사용하는 것을 권장!
	 * 		얘만 enter 처리
	 * */

	public static void main(String[] args) {
		Scanner sc = new Scanner (System.in);
		System.out.println("당신의 이름은 무엇입니까? > ");
		String name = sc.next();
		sc.nextLine(); //남아있는 enter 처리
		
		System.out.println("당신의 나이는 몃살입니까? > ");
//		int age = sc.nextInt();
//		int age = sc.nextInt(); // enter 처리 x
		// sc.nextLine(); //enter 처리
		
		// String -> int
		int age = Integer.parseInt(sc.nextLine());
		
		System.out.println("당신의 집은 어디이십니까? >");
		String addr = sc.nextLine();
		
		System.out.println("당신의 키는 몇입니까? (소수점 첫째 자리까지) >");
		// float height height = sc.nextFloat();
		double height = sc.nextDouble();
		//sc.nextLine()
		
		double heighte = Double.parseDouble(sc.nextLine());
		
		System.out.println("당신의 성별은 무엇입니까? (남/여) >");
		
		String input =sc.nextLine();
		char gender =input.charAt(0);
		//char gender = sc.nextLine().charAt(0);
		
		System.out.printf("당신의 이름은 " + name + "이고 나이는 " + age + "살이고, 사는 곳은 " + addr + "이고 , 키는 " + heighte + "이고 성별은" + gender );
		System.out.printf("이름은 %s이고, 나이는 %d살 이고, 사는 곳은 %s이고, 키는, %.fcm 이고, 성별은 %s", name, age, addr, heighte, gender);
		
	}
		
}
