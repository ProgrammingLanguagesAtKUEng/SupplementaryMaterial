/**
 * Write a description of class IsBranch here.
 * 
 * @author Atsushi Igarashi
 * @version 20200106
 */
public class IsBranch implements BSTVisitor<Boolean> {
	/**
	 * Constructor for objects of class IsBranch
	 */
	public IsBranch() {
	}

	public Boolean caseLeaf() {
		return false;
	}

	public Boolean caseBranch(BinarySearchTree left, int v, BinarySearchTree right) {
		return true;
	}
}
