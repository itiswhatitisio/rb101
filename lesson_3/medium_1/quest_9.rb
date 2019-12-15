def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo)

=begin

foo(param = "no")
 "yes"
end

bar("yes")

Output: "no"

=end