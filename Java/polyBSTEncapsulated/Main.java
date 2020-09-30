
/**
 * Write a description of class Main here.
 * 
 * @author Atsushi Igarashi
 * @version 20171207
 */

import bst.BinarySearchTree;

public class Main {
	public static void main(String[] args) {
		BinarySearchTree<Integer> t0 = BinarySearchTree.empty();
		BinarySearchTree<Integer> t1 = t0.insert(30);
		BinarySearchTree<Integer> t2 = t1.insert(15);
		BinarySearchTree<Integer> t3 = t2.insert(48);
		BinarySearchTree<Integer> t4 = t3.insert(10);
		BinarySearchTree<Integer> t5 = t4.insert(25);
		BinarySearchTree<Integer> t6 = t5.insert(60);
		boolean test1 = t6.find(30); // should be true
		boolean test2 = t6.find(13); // should be false
		BinarySearchTree<Integer> t7 = t6.insert(23);
		BinarySearchTree<Integer> t8 = t6.insert(0);
		boolean test3 = t7.find(23); // should be true
		boolean test4 = t8.find(30); // should be true
		boolean test5 = t8.find(23); // should be false
		BinarySearchTree<Integer> t9 = t8.delete(30);
		boolean test6 = t9.find(30); // should be false
		boolean test7 = t9.find(48); // should be true
		System.out.println("test 1: " + test1);
		System.out.println("test 2: " + test2);
		System.out.println("test 3: " + test3);
		System.out.println("test 4: " + test4);
		System.out.println("test 5: " + test5);
		System.out.println("test 6: " + test6);
		System.out.println("test 7: " + test7);

		BinarySearchTree<String> t10 = BinarySearchTree.empty();
		BinarySearchTree<String> t11 = t10.insert("I");
		BinarySearchTree<String> t12 = t11.insert("Love");
		BinarySearchTree<String> t13 = t12.insert("OCaml");
		BinarySearchTree<String> t14 = t13.insert("How");
		BinarySearchTree<String> t15 = t14.insert("about");
		BinarySearchTree<String> t16 = t15.insert("you?");
		boolean test11 = t16.find("so?"); // should be true
		boolean test12 = t16.find("Ocaml"); // should be false
		BinarySearchTree<String> t17 = t16.insert("Me");
		BinarySearchTree<String> t18 = t17.insert("too");
		boolean test13 = t17.find("Me"); // should be true
		boolean test14 = t18.find("so?"); // should be true
		boolean test15 = t18.find("Why"); // should be false
		BinarySearchTree<String> t19 = t18.delete("How");
		boolean test16 = t19.find("How"); // should be false
		boolean test17 = t19.find("you"); // should be true

		System.out.println(t16);
		System.out.println(t17);
		System.out.println(t18);
		System.out.println(t19);
		System.out.println("test 11: " + test11);
		System.out.println("test 12: " + test12);
		System.out.println("test 13: " + test13);
		System.out.println("test 14: " + test14);
		System.out.println("test 15: " + test15);
		System.out.println("test 16: " + test16);
		System.out.println("test 17: " + test17);
	}
}
