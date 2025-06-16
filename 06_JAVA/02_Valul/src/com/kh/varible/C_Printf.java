package com.kh.varible;

public class C_Printf {

	public static void main(String[] args) {
		// print : 출력만 됨 (줄바꿈 x)
		System.out.print("Hello\n");
		// println : 출력 후 줄바꿈
		System.out.println("Hello");
		
		// printf (출력하고자 하는 형식(포맷), 출력하고자하는 값, 값,...)
		
		int iNum1 =10;
		int iNum2 =20;
		
		// 10% 20%
		System.out.println(iNum1 + "%" + iNum2 + "%");
		// 출력하고자 하는 값들이 제시한 형식에 맞춰서 출력만 진행
		System.out.printf("%d% %d%", iNum1, iNum2);
		
		/*
		 * 포맷에 쓰리는 키워드
		 * %d : 정수
		 * %f : 실수
		 * %c : 문자
		 * %s : 문자열 (문자도 가능)
		 * */
		System.out.println("%5d\n", iNum1); // 5칸 확보 후 오른쪽 정렬
		System.out.println("%-5d\n", iNum2); // 왼쪽 정렬

		double dNum1 = 1.23456789;
		double dNum2 = 4.53;
		// 무조건 소수점 아래 6번째 자리까지
		System.out.println("%f \t %f", dNum1, dNum2); 
		System.out.println("%.3f\t %.1f", dNum1, dNum2);
		
		char ch ='a';
		String str = "Hello";
		System.out.println("%c \t %s",ch, str, ch);
		System.out.println("%C %S", ch, str);
		
		

	}

}
