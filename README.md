# Elixir Katas and Other Exercises

An attempt to learn Elixir by working through some Katas.

See commit messages for notes and details.

Tests can be executed by running `mix test`

----

## Exercises

### Roman Numeral Kata

**Problem**: 

> Convert Arabic versions of numbers to their equivalent Roman numeral versions.

**File**:

* Module: `lib/rn.ex`
* Tests: `test/rn_test.exs`

**Functions**:

* `Rn.romanize/1`
    * Returns the Roman numeral equivalent for a given number

### Sum of Even Fibonacci Numbers

**Problem**:

> By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

**Files**: 

* Module: `lib/fib.ex`
* Tests: `test/fib_test.ex`

**Functions**:

* `fib/1`
    * _returns the n-th number in the Fibonacci sequence
* `sum_of_evens_to/1`
    * _returns the sum of the even numbers in the sequence up to the point where the highest number does not excede a given limit.

### Multiples of Threes and Five

**Problem**: 

> Find the sum of all the multiples of 3 or 5 below 1000.

**Files**:

* Module: `lib/threes_and_fives.ex`
* Tests: `test/threes_and_fives_test.exs`

**Functions**:

* `ThreesAndFives.sum_of_multiples_to/1`
    * _returns the sum of all the multiples of three and five less than the given limit_
