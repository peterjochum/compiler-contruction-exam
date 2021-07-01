# Open excercises

## Top-down parsing: page 189

### Exercise 4.2

Given the grammar A -> (A)A|$\epsilon$​, write pseudocode to parse this grammar
by recursive descent.

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
FIRST(A): {(,$\epsilon$}
FOLLOW(A): {$,)}
```

#### b. Show this grammar is LL1

FIRST(P1) = {(, $\epsilon$}
FIRST(P2) = {$\epsilon$}

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

#### c. Parsing stack and actions

Show the parsing stack and the actions of an SLR(1) parser for the input string:

```text
((a),a,(a,a))
```

#### d. Is this grammar an LR(0) grammar?

If not, describe the LR(0) conflict. If so, construct the LR(0) parsing table,
and describe how a parse might differ from an SLR(1) parse

#### e. LR(1) and LALR(1) differences

Describe any differences that might occur between the actions of a general LR(1)
parser and an LALR(1) parser

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
