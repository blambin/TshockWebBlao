package controller;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Set;

public class maintest {

	public static void main(String[] args) {
		
//		Random r = new Random();
//		
//		int a = 100;
//		
//		for (int i = 0; i < a; i++) {
//			
//			System.out.println(r.nextInt(12));
//		}
//		
//		r = null;
		
		
		
		Set s = new HashSet<>();
		
		s.add("aaa");
		s.add("bbb");
		Iterator<String> a = s.iterator();
		while(a.hasNext()) {
			
			System.out.println(a.next()); 
			s.remove(a);
		}
		
		
		
	}
}
