# Statement

See problem "[Calculate Euler&#39;s totient function φ(m)](#34)" for
the definition of Euler's totient function. If the list of the prime
factors of a number m is known in the form of the previous problem then
the function phi(m) can be efficiently calculated as follows: Let
`[(p1, m1); (p2, m2); (p3, m3); ...]` be the list of prime factors
(and their multiplicities) of a given number m. Then φ(m) can be
calculated with the following formula:

φ(m) = (p1 - 1) × p1<sup>m1 - 1</sup> × (p2 - 1) ×
p2<sup>m2 - 1</sup> × (p3 - 1) × p3<sup>m3 - 1</sup> × ⋯

```ocaml
# phi_improved 10;;
- : int = 4
# phi_improved 13;;
- : int = 12
```