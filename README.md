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

### mapsum

**Problem**: 

(_Exercise "ListsAndRecursion-1" from Chapter 10 of **Programming Elixir ≥ 1.6** by Dave Thomas_)

“Write a mapsum function that takes a list and a function. It
applies the function to each element of the list and then sums the
result, so​ 

    ​iex>​ MyList.mapsum [1, 2, 3], &(&1 * &1)​
    14

Obviously this could easly be done using `Enum.reduce/3` or `Enum.map/2` |> `Enum.sum/1`:

* cheating 1: `Enum.reduce(list, 0, & f.(&1) + &2)`
* cheating 2: `Enum.map(list, f) |> Enum.sum()`

But I think the point of the exercise is to use recursion to recreate the reduce funtionality.

**Files**:

* lib/my_list.ex
* test/my_list_test.exs

**Functions**:

* `MyList.mapsum/2`
    * applies a function to the given list and returns the sum of all the results


### Flatten List

**Problem**: 

(_Exercise "ListsAndRecursion-6" from Chapter 10 of **Programming Elixir ≥ 1.6** by Dave Thomas_)

"(Hard) Write a flatten(list) function that takes a list that may contain
any number of sublists, which themselves may contain sublists, to
any depth. It returns the elements of these lists as a flat list.”

    ​iex>​ MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]] ])​
    [1,2,3,4,5,6]

Hint: You may have to use Enum.reverse to get your result in the
correct order.”

**Files**:

* Module: `lib/my_list.ex`
* Tests: `tests\my_list_test.exs`

**Functions**:

* `MyList.flatten/1`
    * _returns a flat list containing all the elements of a given list containing any number of nested sublists._


### Enum Functions

**Problem**: 

(_Exercise "ListsAndRecursion-5" from Chapter 10 of **Programming Elixir ≥ 1.6** by Dave Thomas_)

“Implement the following Enum functions using no library functions or
list comprehensions: all?, each, filter, split, and take.”

**Files**:

* Module: `lib/my_list.ex`
* Tests: `tests\my_list_test.exs`

**Functions**:

* `MyList.all?/2`
    * _returns true if all elemements of a list return a truthy value when applied to a given function._
* `MyList.any?/2`
    * _returns true if any elemement of a list return a truthy value when applied to a given function._
* `MyList.each/2`
    * _invokes the given fun for each element in a list._
* `MyList.filter/2`
    * _returns a list of all elements of a list that return a truthy value when applied to a given function._
* `MyList.split/3`
    * _returns the elements of a list within a given range._
    * _(ignoring negative values and range boundries for now)_
* `MyList.take/2`
    * _returns the first n number of elements in a list_
    * _(ignoring negative values and range boundries for now)_


### Max List

**Problem**: 

(_Exercise "ListsAndRecursion-2" from Chapter 10 of **Programming Elixir ≥ 1.6** by Dave Thomas_)

“Write a max(list) that returns the element with the maximum value in
the list. (This is slightly trickier than it sounds.)”

**Files**:

* Module: `lib/my_list.ex`
* Tests: `tests\my_list_test.exs`

