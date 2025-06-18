package com.kh.practice;

import java.util.Scanner;

public class VariablePractice {
	
	Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		VariablePractice v = new VariablePractice();
		//v.method1();
		//v.method2();
		//v.method3();
		//v.method4();
		//v.method5();
		//v.method6();
		v.method7();
	}
	
	/*
	 * 영화관의 요금표는 다음과 같다.
	 *  - 성인 : 10000원
	 *  - 청소년 : 7000원
	 * 
	 * 성인 2명과 청소년 3명이 영화를 보려고 할 때 지불해야 할 금액을 계산 후 출력하세요.
	 * */
	public void method1() {
		
		
	int a = 10000;
	int b = 7000;
	System.out.println(a * 2 + b * 3 + "원 입니다." );

	}
	
	/*
	 * x=5, y=7, z=9의 값을 직접 변경하지 않고 변수를 사용하여
	 * 
	 * x=7
	 * y=9
	 * z=5
	 * 
	 * 로 출력하세요.
	 * */
	public void method2() {
		int x = 5;
		int y = 7;
		int z = 9;
		
		// 코드 적어주세요!
		
		int temp = x;
		x = y;
		y = z;
		z = temp;
	
		System.out.println("x=" + x);
		System.out.println("y=" + y);
		System.out.println("z=" + z);
		

	}
	
	

	/*
	 * 정수 두 개를 입력 받아 두 수의 합(+), 차(-), 곱(*), 나누기(/)한 몫을 출력하세요.
	 * 
	 * 첫 번째 정수 : 23
	 * 두 번째 정수 : 7
	 * 더하기 : 30
	 * 빼기 : 16
	 * 곱하기 : 161
	 * 나누기 몫 : 3
	 * */
	public void method3() {
		
		
		System.out.println("첫 정수");
		int num1 = Integer.parseInt(sc.nextLine());
		
		System.out.println("첫 정수");
		int num2 = Integer.parseInt(sc.nextLine());
		
		
		System.out.println(num1 + num2);
		System.out.println(num1 - num2);
		System.out.println(num1 * num2);
		System.out.println(num1 / num2);
		
		
		
	}

	/*
	 * 가로, 세로 값을 입력 받아 사각형의 면적과 둘레를 계산하여 출력하세요.
	 * 공식) 면적 : 가로 * 세로
	 *       둘레 : (가로 + 세로) * 2
	 * 
	 * 가로 : 13.5
	 * 세로 : 41.7
	 * 면적 : 562.95
	 * 둘레 : 110.4
	 * */
	public void method4() {
		
		//  코드 정렬 : 내가 정렬하고자 하는 부분 선택하시고  Ctrl + shift + f
		System.out.println("가로 : ");
		double a = Double.parseDouble(sc.nextLine());
		
		System.out.println("세로 : ");
		double b = Double.parseDouble(sc.nextLine());
		
		
		System.out.println(a * b);
		System.out.println((a + b) * 2);

	}

	/*
	 * 영어 문자열 값을 입력 받아 문자에서 첫번째, 두번째, 마지막 글자(문자열.length())를 출력하세요.
	 * 
	 * 문자열을 입력하세요 : apple
	 * 첫번째 문자 : a
	 * 두번째 문자 : p
	 * 마지막 문자 : e
	 * */
	public void method5() {
		System.out.println("문자열립력");
		String word = sc.nextLine();
		System.out.println("apple".charAt(0));
		System.out.println("apple".charAt(1));
	}

	/*
	 * 문자 하나를 입력 받아 그 문자와 다음 문자의 유니코드를 출력하세요.
	 * 
	 * 문자 : A
	 * A unicode : 65
	 * B unicode : 66
	 * */
	public void method6() {
		char word = 'A';
		int num = word;
		System.out.println(word +" unicode :" + num);
		System.out.println((char)(num + 1) +" unicode : " + (num + 1));
	}
	
	/*
	 * 국어, 영어, 수학 세 과목의 점수를 입력 받아 총점과 평균을 출력하세요.
	 * 
	 * 국어 : 75
	 * 영어 : 63
	 * 수학 : 80
	 * 총점 : 218
	 * 평균 : 72.67
	 * */
	public void method7() {
		Scanner sc = new Scanner (System.in);
		System.out.println("국어점수를 입력하시오");
		double a = Integer.parseInt(sc.nextLine());
		
		System.out.println("영어점수를 입력하시오");
		double b = Integer.parseInt(sc.nextLine());
		
		System.out.println("수학점수를 입력하시오");
		double c = Integer.parseInt(sc.nextLine());
		
		System.out.println("당신의 평균 점수는 : "
		
				+ (a+b+c)/3 + "이고 합계로는" + (a+b+c) + "점 입니다");
	}

}