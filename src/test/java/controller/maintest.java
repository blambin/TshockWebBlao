package controller;

import java.util.Random;

public class maintest {

	public static void main(String[] args) {
		
		Random r = new Random();
		
		int a = 100;
		
		for (int i = 0; i < a; i++) {
			
			System.out.println(r.nextInt(12));
		}
		
		r = null;
	}
}
