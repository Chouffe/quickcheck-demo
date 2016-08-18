# Haskell Quickcheck Demo: Learning Lunch

## Introduction

QuickCheck is a library for random testing of program properties.
It is one of the best and most popular libraries that the Haskell ecosystem provides. It takes testing to an other level.

Writing unit tests is boring and does not give strong correctness confidence unless all edge cases have been thoroughly studied and specced out. It takes time and it is impossible to cover the whole input space for a given program... Quickcheck addresses this problem :-)

Haskell already provides a beautiful and powerful type system that help catch type related bugs at compile time (unlike Java for instance).
Quickcheck generates tests for testing correctness of a given program.

The programmer provides a specification of the program, in the form of properties which functions should satisfy, and QuickCheck then tests that the properties hold in a large number of randomly generated cases.

## Properties

The first step to testing with Quickcheck is to work out some properties that are true of the function for ALL inputs.
Some invariants need to be found (see examples below)

Examples:
```
-- Commutativity of `+`
∀ a, b, a + b = b + a
```

```
-- Transitivity of `<`
∀ x, y, z st x < y  and y < z, x < z
```

```
-- reverse is its own inverse
reverse . reverse == identity
```

```
-- Idempotence
sort . sort = sort
```

```
-- Constraints on length
∀ n, xs, length (take n xs) <= length xs
```

```
-- And so on... Be creative (and use math ^^)
```

## Tests Generation

Given a property and a number of test cases to generate, QuickCheck will test the property on randomely generated input elements.
Running the property against a large number of different input elements give very STRONG confidence that the program is correct.

Regular Unit testing does only test one specific input element for the given program. What if you forgot an edge case in your Unit Tests? What is the confidence that your program is CORRECT? Almost none... :(

## Quickcheck Steps

1. Input generation
2. Property Testing
    + If failed: will shrink the input elements as much as possible until it cannot shrink further
    + If succeeded go to 1

## How practical is Quickcheck?

Writing programs that satisfy invariants and properties lead to extremely clean, composable, reusable code. Mixing TDD with Quickcheck is a very good way of keeping high code quality.
Quickcheck can find bugs that you'd never thought of.

Unit tests are still needed in practice when some properties cannot be defined for a given program.

## Conclusion

`Do not write tests, generate them!`
