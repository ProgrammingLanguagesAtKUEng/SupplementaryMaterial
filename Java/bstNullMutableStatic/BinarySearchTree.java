/**
 * Two kinds of nodes (leaf or branch) are expressed by whether the value is
 * null or not. Immutable data structure so that tree manipulation returns a new
 * tree. All operations are implemented by static methods ;-(
 *
 * @author Atsushi Igarashi
 * @version 20181103
 */
public class BinarySearchTree {
    private BinarySearchTree left;
    private int v;
    private BinarySearchTree right;

    /**
     * Constructor for objects of class Leaf
     */
    public BinarySearchTree(BinarySearchTree left, int v, BinarySearchTree right) {
        this.left = left;
        this.v = v;
        this.right = right;
    }

    /**
     * A method to find the given number in a BST.
     *
     * @param t BST to be searched
     * @param n the number to be searched for
     * @return whether n is found in the BST
     */
    public static boolean find(BinarySearchTree t, int n) {
        if (t == null) {
            return false;
        } else if (n == t.v) {
            return true;
        } else if (n < t.v) {
            return find(t.left, n);
        } else /* n > t.v */ {
            return find(t.right, n);
        }
    }

    /**
     * A method to insert a number into a BST.
     *
     * @param t BST to be added to
     * @param n the number to be added
     * @return a new BST with n (or the same tree, if n is already in the BST)
     */
    public static BinarySearchTree insert(BinarySearchTree t, int n) {
        if (t == null) {
            return new BinarySearchTree(null, n, null);
        } else if (n == t.v) {
            // do nothing
        } else if (n < t.v) {
            t.left = insert(t.left, n);
        } else /* n > t.v */ {
            t.right = insert(t.right, n);
        }
        return t;
    }

    /**
     * A method to find a minimum number in a BST
     *
     * @param t BST
     * @return a minimum number in the BST
     */
    public static int min(BinarySearchTree t) {
        if (t == null) {
            return Integer.MIN_VALUE;
        } else if (t.left == null) {
            return t.v;
        } else {
            return min(t.left);
        }
    }

    /**
     * A method to delete a number from a BST.
     *
     * @param t BST
     * @param n the number to be deleted
     * @return a new BST without n (or the same tree, if n is not in the BST)
     */
    public static BinarySearchTree delete(BinarySearchTree t, int n) {
        if (t == null) {
            // do nothing
        } else if (n == t.v) {
            if (t.left == null) {
                if (t.right == null) {
                    return null;
                } else {
                    return t.right;
                }
            } else {
                if (t.right == null) {
                    return t.left;
                } else {
                    int m = BinarySearchTree.min(t);
                    t.right = delete(t.right, m);
                }
            }
        } else if (n < t.v) {
            if (t.left != null) {
                t.left = delete(t.left, n);
            } else {
            }
        } else /* n > t.v */ {
            if (t.right != null) {
                t.right = delete(t.right, n);
            } else {
            }
        }
        return t;
    }

    /**
     * An iterative method to find the given number in a BST.
     *
     * @param t BST to be searched
     * @param n the number to be searched for
     * @return whether n is found in the BST
     */
    public static boolean findIter(BinarySearchTree t, int n) {
        while (true) {
            if (t == null) {
                return false;
            } else if (n == t.v) {
                return true;
            } else if (n < t.v) {
                t = t.left;
                n = n;
            } else /* n > t.v */ {
                t = t.right;
                n = n;
            }
        }
    }

    /**
     * An iterative method to find the given number in a BST.
     *
     * @param t BST to be searched
     * @param n the number to be searched for
     * @return whether n is found in the BST
     */
    public static boolean findIterTake2(BinarySearchTree t, int n) {
        while (t != null && n != t.v) {
            if (n < t.v) {
                t = t.left;
            } else /* n > t.v */ {
                t = t.right;
            }
        }
        return (t != null);
    }

}
