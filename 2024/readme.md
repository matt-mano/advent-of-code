# 2024
Since this is my first year working professionally with Ruby, my goal for this year is primarily to focus on some Ruby fundementals and practice working with Ruby in a semi-functional style.

# Day 1
## First challenge
The main bound on time complexity with this problem is sorting the input arrays.  Using Ruby's map we can quickly parse the input into lists and sort them.  After that it's a single pass to collect diffs.  I need to learn how to .reduce in Ruby.

Time complexity O(n log(n)) where n = number of lines of input

## Second challenge
The second challenge actually has a better runtime bound but I suspect will be slower in practice due to the number of passes I'm making through the list.

- First Pass: 
    Take the loaded data and create a frequency hash of the second column.  This should happen in linear time because hash accesses are constant.
- Second Pass:
    For each of the items in the first list - check the frequency graph and start counting.

This should complete in O(n) where n = number of lines of input.

# Day 2
I'm starting to understand the format of these a little better and combined the solution into a single script this time.

My thought is to use a single sliding window.  Before starting the slide we first determine increasing or decreasing based on the first "jump" to allow for doing this in one directon only.

Complexity of each validation is linear O(length_of_line)

For the first challenge we only need to check each line one time, runtime is O(total_lines * length_of_lines) or O(total_number_of_numbers)

For the second challenge due to the small sizes of the lines and the manageable count I went with a simple brute force implemented with .any? and Ruby ranges.  This could be solved better by dynamically storing "safe" ranges per line, but this solution still completed near-instantly.

An easy way to express runtime on this would be O(number_of_lines * (max_line_length ^ 2)) since at most we will check each line once per entry in the line, and each check takes the length of the line.

# Day 3
## Regular expressions are fun to bound
The runtime of evaluating -most- regular expressions on a list is O(length_of_input_test) because they compile to deterministic finite state machines.  The compile performance of building that state machine can be significantly worse, and this was a simple enough problem that I could have probably rolled a parser in about the same amount of time as I spent fumbling on regex101.

## The solution
This solution tokenizes the input into tokens of either mul(a,b) do() or don't() (runs in O(input_length)) and then in a second pass evaluates each token.  I'm keeping a separate tally of every mul() and only the "doing" mul()s within the pass (runs in O(input_length) also) for overall linear runtime.

# Day 4
//TODO

# Day 5
//TODO