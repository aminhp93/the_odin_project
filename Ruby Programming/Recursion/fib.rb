def fibs(n)
  a = 0
  b = 1
  i = 0
  result = [1]
  while i.to_s.length < n
  	i += 1
  	a, b = b, a + b
  	result << b
  end
  result
end
puts fibs(10)