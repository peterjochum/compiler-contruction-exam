# Compiler construction 2021 - exam preparation

Author: Peter Jochum

## Lexical analysis (page 91)

### Exercise 2.1

Write regular expressions for the following character sets, or give reasons
why no expression can be written:

#### a. All strings of lowercase letters that begin and end in **a**

```text
a[a-z]*a|a
```

#### b. All strings of lowercase letters that either begin or end in a (or both)

```text
a[a-z]*|[a-z]*a
```

#### c. All strings of digits that contain no leading zeros

```text
[1-9][0-9]*
```

#### d. All strings of digits that represent even numbers

```text
^[0-9]*[0|2|4|6|8]$
```

#### e. All strings of digits such that all the 2's occur before all the 9's

```text
[0-8]*[0|1|3-9]*
```

#### f. All strings of a's and b's that contain no three consecutive b's

```bash
#Solution 1 - Thanks to Selene
a*(b|bb)?(a+(b|bb)?)*

# Solution 2 - Thanks to Sebastian
(a* | (ba+) | (bba+))* (b|bb)?
```
  
DFA accepting the language:

![DFA](out/2.1f.png)

#### g. All strings containing an odd number of a's and/or b's

```bash
b*ab*(b*ab*ab*)*$|a*ba*(a*ba*ba*)*
```

[g. Test on regex101](https://regex101.com/r/nkd6Xp/1)

#### h. All strings of a's and b's that contain an even number of a's and b's

```text
# Selene
(b*ab*ab*)*|(a*ba*ba*)*
```

#### i. All strings of a's and b's that contain exactly as many a's and b's
  
Not possible - would need an unlimited number of states to memorize count.
  
### Excercise 2.9

Construct a DFA accepting case, char, continue

![DFA for Keywords](out/2.9.png)

## Context free grammars (page 138)

### Excercise 3.2

**Language**
A -> AA | (A) | e

#### a. Describe the generated language

Generates a set of matching braces

Regex (?R) is a recursion of the whole pattern - [Test on regex101](https://regex101.com/r/cAb5Z6/1)

```bash
\((?R)*\)

# Examples
(())()
()(((())))
()()()()
```

#### b. Show it is ambigous

Ambiguity shown by finding 2 leftmost or rightmost derivations for an input string:

**Input string:** ()

Leftmost derivation 1:

```text
A -> (A)
  -> ()
```

Leftmost derivation 2:

```text
A -> AA
  -> (A)A
  -> ()A
  -> ()
```

### Excercise 3.4

The following grammar generates all regular rexpressions over the alphabet of
letters. (vertical bar in "" is operator).

```text
rexp -> rexp "|" rexp
        | rexp rexp
        | rexp *
        | (rexp)
        | letter
```

#### a. Give a derivation for the regular expression (ab|b)\* using this grammar

|      | Step               |
|------|--------------------|
| rexp | rexp*              |
|      | (rexp)*            |
|      | (rexp\|rexp)*      |
|      | (rexp rexp\|rexp)* |
|      | (a rexp\|rexp)*    |
|      | (ab\|rexp)*        |
|      | (ab\|b)*           |

#### b. Show that the grammar is ambigous

Input string: abc

Leftmost derivation 1:

|      | Step        |
|------|-------------|
| rexp | rexp rexp   |
|      | a rexp      |
|      | a rexp rexp |
|      | a b rexp    |
|      | a b c       |

Leftmost derivation 2:

|      | Step           |
|------|----------------|
| rexp | rexp rexp      |
|      | rexp rexp rexp |
|      | a rexp rexp    |
|      | a b rexp       |
|      | a b c          |

#### c. Rewrite this grammar to establish the correct precedences for the operators

```grammar
rexp -> rexp "|" C | C
C -> C F | F
F ->  L * | L
L -> (rexp) | letter
```

d. What associativity does your answer in c. give to the binary operators? Why?:

Left recursion -> left associativity

## Top-down parsing: page 189

### Exercise 4.2

Given the grammar A -> (A)A|e, write pseudocode to parse this grammar by recursive descent.

```java
RDP():
  Token token

  parseA():
    if token isEqualTo "("
      match("(")
      parseA()
      if token isEqualTo ")"
        match(")")
      else printError()
      parseA()

match(expected_token):
  if nextInputToken() isNotEqualTo expected_token
    printError()
  consumeToken()
```

### Excercise 4.7

#### a. Construct the first and follow sets for the nonterminal A

```text
FIRST(A): {(,e}
FOLLOW(A): {$,)}
```

#### b. Show this grammar is LL1

FIRST(P1) = {(, e}
FIRST(P2) = {e}

FIRST(P1) and FIRST(P2) = {} -> therefore LL(1)

No collisions if there is are no intersections.

## Bottom-up parsing: page 250

### Exercise 5.1

Consider the following grammar:

```text
E -> (L) | a
L -> L,E | E
```

#### a. Construct the DFA of LR(0) items for this grammar

#### b. Construct the SLR(1) parsing table

#### c. Show the parsing stack and the actions of an SLR(1) parser for the input string ((a),a,(a,a))

#### d. Is this grammar an LR(0) grammar? If not, describe the LR(0) conflict. If so, construct the LR(0) parsing table, and describe how a parse might differ from an SLR(1) parse

#### e. Describe any differences that might occur between the actions of a general LR(1) parser and an LALR(1) parser

### Excercise 5.2 - Consider the grammar of 5.1

#### a. Construct the DFA of LR(1) items for this grammar

#### b. Construct the general LR(1) parsing table

#### c. Construct the DFA of LALR(1) items for this grammar

#### d. Construct the LALR(1) parsing table

## Attribute grammars: page 338

```text
dnum  -> num.num
num   -> num digit | digit
digit -> 0 | 1 | 2 | ... | 9 |
```

### Exercises 6.3

### Excercise 6.4

## Runtime environments: page 388, exercises 7.2 and 7.15

## Code generation: page 485, exercises 8.1 and 8.3

## Literature

- [Compiler construction principles, k.C. Louden](https://csunplugged.files.wordpress.com/2012/12/compiler-construction-principles-and-practice-k-c-louden-pws-1997-cmp-2002-592s.pdf)
- [Regex examples and solutions](https://www.cs.cmu.edu/~iliano/courses/09S-CMU-CS212/classwork/recitations/rec21/rec21-sol.pdf)
