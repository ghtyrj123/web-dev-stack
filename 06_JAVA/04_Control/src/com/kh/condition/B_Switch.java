package com.kh.condition;

import java.util.Scanner;

public class B_Switch {
	
	Scanner sc =  new Scanner(System.in);
	/*
	 * 
	 * switch(조건식) {
	 * 	case 값1
	 * 		조건식의 결과가 값1과 같은 경우 실행
	 * 		break;
	 * 		case 값2 :
	 * 		조건식의 결과가 값2와 같은 경우 실행
	 * 		break;
	 * default : 조건식의 결과가 일치하는 case문이 없을 때 실행
	 * }
	 * 
	 * - case 문의 수는 제한이 없다
	 * - 조건식 결과는 정수, 문자, 문자열이여야 한다
	 * - 조건문을 빠져나가려면 break가 필요하다
	 * - default문은 생략 가능하다 
	 * */
	
	/*
	 * 숫자를 입력받아
	 * 1일 경우 "빨간색입니다"
	 *  * 2일 경우 "파란색입니다"
	 *   * 3일 경우 "초록색입니다"
	 *   * 잘못입력했을 경우 "잘못입력했습니다"
	 *   
	 * */
	public void method1() {
		System.out.println("숫자를 입력하시오~");
		int num = sc.nextInt();
		
		switch (num)  {
		case  1 :
			System.out.println("빨간색");
			break;
		case  2 :
			System.out.println("파란색");
			break;
		case  3 :
			System.out.println("초록색");
			break;
			default : System.out.println("색깔이 없음");
		 
		}
		/*
		 * 
		 * 주민번호를 입력받아 "남자" 인지 "여자" 인지 출력*/
		
			
			
			
		}
	
	public void method2() {
		System.out.println("주민번호 입력해라 >");
		String no = sc.nextLine();
		char noChar = no.charAt(7);
		String noStr = no.substring(7, 8);
		
		
		
		
		switch (noChar) {
		case '1' : System.out.println("남자입니다");
		break;
		case '2' : System.out.println("여자입니다");
		break;
		default : System.out.println("성별이 존재하지 않음");
		}
	}

	public static void main(String[] args) {
		B_Switch b = new B_Switch();
		//b.method1();
		b.method2();
	}

}
