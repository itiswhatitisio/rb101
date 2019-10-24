=begin

# Problem

Input:
- bill_amount -> integer
- tip_percent -> integer

Output:
- tip_amount -> bill_amount * tip_percent
- bill_total = bill_amount + tip

# Examples/Test cases
bill_amount = 200;
tip_percent = 15%;
tip_amount = $30;
bill_total = $230.00;

# Requirements
- convert percentage to integer?
- display tip as a float
- display bill_total as a float

# Data structure
- integers

# Algorithm
- get bill_amount
- get tip_percent
- convert tip_percent to tip = tip_percent * 0.01;
- calculate tip_amount = bill_amount * tip;
- calculate bill_total = bill_amount + tip_amount;
- display results

=end

Kernel.puts("What is the bill?")
bill_amount = Kernel.gets().to_f

Kernel.puts("What is the tip percentage?")
tip_percent = Kernel.gets().to_f

tip = tip_percent * 0.01
tip_amount = (bill_amount * tip)
bill_total = (bill_amount + tip_amount)

Kernel.puts("The tip is $%0.2f" % tip_amount) 
Kernel.puts("The total is $%0.2f" % bill_amount)

