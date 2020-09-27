#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

int sum(int n) {
  /* static int i = 0; */
  /* printf("%d, %p\n", i++, &n); */
  if (n == 1) { return 1; }
  else { return n + sum(n - 1); }
}

int sum2(int n, int m) {
  if (n == 1) { return m + 1; }
  else { return sum2(n-1, m + n); }
}

int sum2_iter(int n, int m) {
  while (true) {
    if (n == 1) { return m + 1; }
    else {
      // return sum2(n-1, m + n);
      m = m + n;
      n = n - 1;
    }
  }
}

int sum2_iter2(int n, int m) {
  while (n != 1) {
    m = m + n;
    n = n - 1;
  }
  return m + 1;
}

int gcd(int n, int m) {
  /* assert(n>0 && m>0); */
  /* static int i = 0; */
  /* printf("%d, %p\n", i++, &n); */
  if (n == m) { return n; }
  else if (n > m) { return gcd(n-m, m); }
  else /* m > n */ { return gcd(m-n, n); }
}

int gcd_iter(int n, int m) {
  while (true) {
    if (n == m) { return n; }
    else if (n > m) {
      n = n - m;
      m = m;
    } else /* m > n */ {
      int tmp = n;
      n = m - n;
      m = tmp;
    }
  }
}

int gcd_iter_take2(int n, int m) {
  assert(n>0 && m>0);
  while (n != m) {
    if (n > m) {
      n = n - m;
      m = m;
    } else /* m > n */ {
      int tmp = n;
      n = m - n;
      m = tmp;
    }
  }
  return n;
}

bool find_iter(struct tree *t, int n) {
  while (true) {
    if (t->tag == LEAF) {
      return false;
    } else /* t->tag == BRANCH */ {
      struct branch b = t->dat.br;
      if (n == b.value) {
        return true;
      } else if (n < b.value) {
        t = b.left;
        n = n;
      } else /* n > b.value */ {
        t = b.right;
        n = n;
      }
    }
  }
}

bool find_iter_take2(struct tree *t, int n) {
  while (t->tag != LEAF && n != t->dat.br.value) {
    struct branch b = t->dat.br;
    if (n < b.value) {
      t = b.left;
    } else /* n > b.value */ {
      t = b.right;
    }
    // or, equivalently, t = (n < b.value) ? b.left : b.right;
  }
  return (t->tag != LEAF);
}

int main(void) {

/*  int n = 260000;
  printf("sum(%d) = %d\n", n, sum(n));
  printf("sum2(%d) = %ud\n", n, sum2(n, 0));
  printf("sum_iter(%d) = %d\n", n, sum2_iter(n, 0));

*/
  int a = 540000001;
  int b = 2;
  printf("gcd(%d, %d) = %d\n", a, b, gcd(a, b));

  return 0;
}

