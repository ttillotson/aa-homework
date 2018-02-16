def sum_to(num)
  return nil if num < 0
  num + sum_to(num - 1)
end

def add_numbers(arr)
  return arr[0] if arr.length < 2
  arr[-1] + add_numbers(arr[0...-1])
end

def gamma_fnc(num)
  return nil if num < 1
  (num - 1) * gamma_fnc(num - 1)
end

def ice_cream_shop(choice_arr, flavor)
  return true if flavor == choice_arr[0]
  return false if choice_arr.length < 1
  ice_cream_shop(choice_arr[1..-1], flavor)
end

def reverse(str)
  return str if str.length < 2
  str[-1] + reverse(str[0..-2])
end
