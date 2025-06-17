package operator;

public class C_Arithmetic {
	/*
	 * 산술 연산자
	 *  + : 더하기
	 *  - : 빼기
	 *  * : 곱하기
	 *  / : 나누기
	 *  % : 나머지
	 * */

	public static void main(String[] args) {
		C_Arithmetic c = new C_Arithmetic();
		c.method2();
		
		

	}
	public void method1() {
		int num1 =10;
		int num2 = 3;
		
		System.out.println(" + :" + (num1 + num2)); // 13
		System.out.println(" - :" + (num1 - num2)); // 7
		System.out.println(" * :" + (num1 * num2)); // 30
		System.out.println(" / :" + (num1 / num2)); // 3 - 나누기 몫
		System.out.println(" % :" + (num1 % num2)); // 1 
	}
	
	public void method2() {
		int a = 5;
		int b =10;
		int c = (++a) + b++;  //  a= 6, b =11 c = 6 + 10 = 16
		int d = c / a;  //d = 16 / 6 = 2
		int e = c % a;  // e = 16 % 6 = 4
		int f = e++;   // e = 5, f = 4;
		int g = (--b) + (d--); // b = 10, d = 1, g = 10 + 2 = 12
		int h = c-- * b; // c =15, h = 16 * 10 = 160
		int i = (a++) + b / (--c /f) * (g-- -d) % (++e + h); //  6 + 10 / (14 / 4) * (12 - 1) % (6 + 160)
		System.out.println();
		
		
		
	}

}
