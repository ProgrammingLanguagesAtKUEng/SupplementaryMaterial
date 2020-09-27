let rec sum n =
    if n = 1 then 1
    else n + sum (n-1)

let rec gcd(n, m) =
  if n = m then n
  else if n > m then gcd(n-m, m)
  else (* m > n *) gcd(m-n, n)

let rec sum' (n, m) =
  m + (if n = 1 then 1
       else sum' (n-1, n))

let rec sum'' (n, m) =
  if n = 1 then m + 1
  else sum'' (n-1, m + n)
