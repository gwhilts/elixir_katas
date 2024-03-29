# Elixir Katas and Other Exercises

An attempt to learn Elixir by working through some Katas.

See commit messages for notes and details.

Tests can be executed by running `mix test`

----

## Exercises

### Roman Numeral Kata

**Problem**: 

Convert Arabic versions of numbers to their equivalent Roman numeral versions.

**File**:

* Module: `lib/rn.ex`
* Tests: `test/rn_test.exs`

**Functions**:

* `Rn.romanize/1`
    * Returns the Roman numeral equivalent for a given number

### Sum of Even Fibonacci Numbers

**Problem**:

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

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

### ListsAndRecursion-1: mapsum

**Problem**: 

(_Exercise "ListsAndRecursion-1" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

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

* `lib/prag_prog/my_list.ex`
* `test/prag_prog/my_list_test.exs`

**Functions**:

* `PragProg.MyList.mapsum/2`
    * applies a function to the given list and returns the sum of all the results

### ListsAndRecursion-2: Max List

**Problem**: 

(_Exercise "ListsAndRecursion-2" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

“Write a max(list) that returns the element with the maximum value in
the list. (This is slightly trickier than it sounds.)”

**Files**:

* Module: `lib/prag_prog/my_list.ex`
* Tests: `test/prag_prog/my_list_test.exs`

**Functions**:

* `PragProg.MyList.max/1`

### ListsAndRecursion-3: Caesaar

**Problem**:

(_Exercise "ListsAndRecursion-3" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

“An Elixir single-quoted string is actually a list of individual
character codes. Write a caesar(list, n) function that adds n to
each list element, wrapping if the addition results in a
character greater than _z_." ​ 

    ​iex>​ MyList.caesar(​'ryvkve'​, 13)​ 
    ?????? :)

**Files**:

* Module: `lib/prag_prog/my_list.ex`
* Tests: `test/prag_prog/my_list_test.exs`

**Functions**:

* `PragProg.MyList.caesar/2`

### ListsAndRecursion-4: Span

**Problem**:

(_Exercise "ListsAndRecursion-4" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

“Write a function MyList.span(from, to) that returns a list of the
numbers from from up to to.”

I assume this means to not use the obvious Enum.to_list(from..to), but to reimplement
it with a new method to achieve the same effect.

**Files**:

* Module: `lib/prag_prog/my_list.ex`
* Tests: `test/prag_prog/my_list_test.exs`

**Functions**:

* `PragProg.MyList.span/2`

### ListsAndRecursion-5: Enum Functions

**Problem**: 

(_Exercise "ListsAndRecursion-5" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

“Implement the following Enum functions using no library functions or
list comprehensions: all?, each, filter, split, and take.”

**Files**:

* Module: `lib/prag_prog/my_list.ex`
* Tests: `test/prag_prog/my_list_test.exs`

**Functions**:

* `PragProg.MyList.all?/2`
    * _returns true if all elemements of a list return a truthy value when applied to a given function._
* `PragProg.MyList.any?/2`
    * _returns true if any elemement of a list return a truthy value when applied to a given function._
* `PragProg.MyList.each/2`
    * _invokes the given fun for each element in a list._
* `PragProg.MyList.filter/2`
    * _returns a list of all elements of a list that return a truthy value when applied to a given function._
* `PragProg.MyList.split/3`
    * _returns the elements of a list within a given range._
    * _(ignoring negative values and range boundries for now)_
* `PragProg.MyList.take/2`
    * _returns the first n number of elements in a list_
    * _(ignoring negative values and range boundries for now)_

### ListsAndRecursion-6: Flatten List

**Problem**: 

(_Exercise "ListsAndRecursion-6" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

"(Hard) Write a flatten(list) function that takes a list that may contain
any number of sublists, which themselves may contain sublists, to
any depth. It returns the elements of these lists as a flat list.”

    ​iex>​ MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]] ])​
    [1,2,3,4,5,6]

Hint: You may have to use Enum.reverse to get your result in the
correct order.”

**Files**:

* Module: `lib/prag_prog/my_list.ex`
* Tests: `test/prag_prog/my_list_test.exs`

**Functions**:

* `PragProg.MyList.flatten/1`
    * _returns a flat list containing all the elements of a given list containing any number of nested sublists._

### ListsAndRecursion-8: Sales Tax

**Problem**:

(_Exercise "ListsAndRecursion-8" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

“The Pragmatic Bookshelf has offices in Texas (TX) and North Carolina (NC), so we have to 
charge sales tax on orders shipped to these states. The rates can be expressed as a keyword 
list (I wish it were that simple.…):​ 

    tax_rates = [ NC: 0.075, TX: 0.08 ]

Here’s a list of orders:​  
 
    orders = [  [ id: 123, ship_to: :NC, net_amount: 100.00 ],  
                [ id: 124, ship_to: :OK, net_amount:  35.50 ],  
                [ id: 125, ship_to: :TX, net_amount:  24.00 ],  
                [ id: 126, ship_to: :TX, net_amount:  44.80 ],  
                [ id: 127, ship_to: :NC, net_amount:  25.00 ],  
                [ id: 128, ship_to: :MA, net_amount:  10.00 ],  
                [ id: 129, ship_to: :CA, net_amount: 102.00 ],  
                [ id: 130, ship_to: :NC, net_amount:  50.00 ]  
    ]

Write a function that takes both lists and returns a copy of the
orders, but with an extra field, total_amount, which is the net
plus sales tax. If a shipment is not to NC or TX, there’s no tax
applied."

**Files**:

* `lib/prag_prog/orders.ex`
* `test/prag_prog/orders_test.exs`

**Functions**:

* PragProg.calc_totals/2

### StringsAndBinaries-5: Centered Column

**Problem**:

(_Exercise "StringsAndBinaries-5" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

"Write a function that takes a list of double-quoted strings and prints each on a
separate line, centered in a column that has the width of the
longest string. Make sure it works with UTF characters.​"

    ​iex>​ center([​"​​cat"​, ​"​​zebra"​, ​"​​elephant"​])​ 
       cat​
      zebra
    ​ elephant


**Files**:

* `lib/prag_prog/my_string.ex`
* `test/prag_prog/my_string_test.exs`

**Functions**:

* `PragProg.MyString.center/1`

### StringsAndBinaries-6: Capitalize Sentences

**Problem**:

"Write a function to capitalize the sentences in a string.

Each sentence is terminated by a period and a space. Right now, the case of the characters in the string is
random."​ 

    ​iex>​ capitalize_sentences(​"​​oh. a DOG. woof. "​)​ 
    "Oh. A dog. Woof. "

**Files**:

* `lib/prag_prog/my_string.ex`
* `test/prag_prog/my_string_test.exs`

**Functions**:

* `PragProg.MyString.sentence_case/1`

### StringsAndBinaries-7: Parse CSV File

**Problem**:

"Chapter 7 had an exercise about calculating sales tax. We now have the
sales information in a file of comma-separated id, ship_to, and
amount values. The file looks like this:"

    id,ship_to,net_amount​
    123,:NC,100.00​ 124,:OK,35.50​
    125,:TX,24.00​ 126,:TX,44.80​ 
    127,:NC,25.00​ 128,:MA,10.00​ 
    129,:CA,102.00​ 120,:NC,50.00

Write a function that reads and parses this file and then passes
the result to the sales_tax function. Remember that the data should
be formatted into a keyword list, and that the fields need to be the
correct types (so the id field is an integer, and so on).

You’ll need the library functions `File.open`, `IO.read(file, :line)`, and `IO.stream(file)`.

**Files**:

* `lib/prag_prog/orders.ex`
* `test/prag_prog/orders_test.exs`

**Functions**:

* `PragProg.Orders.parse_file/1`
* `PragProg.Orders.calc_totals/2`


###  CSV Sigil

**Problem**:

(_Exercise "MoreCoolStuff-1" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

"Write a sigil ~v that parses multiple lines of comma-separated
data, returning a list where each element is a row of data and
each row is a list of values. Don’t worry about quoting—just assume
each field is separated by a comma."

For example

    csv = ​~​v​"""​​ 
    ​1,2,3​​ 
    ​cat,dog​​ 
    ​"""​

would generate 

    [["1","2","3"], ["cat","dog"]]


(_Exercise "MoreCoolStuff-2" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

"The function Float.parse converts leading characters of a string
to a float, returning either a tuple containing the value and the
rest of the string, or the atom :error.

Update your CSV sigil so that numbers are automatically converted:​ 

    csv = ​~​v​"""​​ 
    ​1,2,3.14​​ 
    ​cat,dog​​ ​
    """​

should generate 

    [[1.0,2.0,3.14], ["cat","dog"]]
    
(_Exercise "MoreCoolStuff-3" from **Programming Elixir ≥ 1.6** by Dave Thomas_)

(Hard) Sometimes the first line of a CSV file is a list of the
column names. Update your code to support this, and return the
values in each row as a keyword list, using the column names as the
keys. Here’s an example:​ 

    csv = ​~​v​"""​​ ​
    Item,Qty,Price​​ 
    ​Teddy bear,4,34.95​​ ​
    Milk,1,2.99​​ 
    ​Battery,6,8.00​​ ​
    """​

would generate​ 

    [​   
      [​Item:​ ​"​​Teddy bear"​, ​Qty:​ 4, ​Price:​ 34.95],​   
      [​Item:​ ​"​​Milk"​, ​Qty:​ 1, ​Price:​ 2.99],​  
      [​Item:​ ​"​​Battery"​, ​Qty:​ 6, ​Price:​ 8.00]​ 
    ]


**Files**:

* `lib/prag_prog/csv_sigil.ex`
* `test/prag_prog/csv_sigil_test.exs`

**Functions**:

* `PragProg.CSVSigil.v_sigil/2`

_Note: this function is not called directly. Instead, a consuming module (e.g. PragProg.CSVSigilTest) should `use PragProg.CSVSigil`, allowing it to then use the sigil (`~v[...]`) within its functions.