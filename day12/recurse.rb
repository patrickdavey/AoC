def save_pair(parent, myHash)
  myHash.each {|key, value|
    value.is_a?(Hash) ? save_pair(key, value) :
            puts("parent=#{parent.nil? ? 'none':parent}, (#{key}, #{value})")
  }
end

def iterate(h)
  h.each do |k,v|
    # If v is nil, an array is being iterated and the value is k. 
    # If v is not nil, a hash is being iterated and the value is v.
    # 
    value = v || k

    if value.is_a?(Hash) || value.is_a?(Array)
      puts "evaluating: #{value} recursively..."
      iterate(value)
    else
      # MODIFY HERE! Look for what you want to find in the hash here
      # if v is nil, just display the array value
      puts v ? "key: #{k} value: #{v}" : "array value #{k}"
    end
  end
end
