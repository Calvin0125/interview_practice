def minimumStepsToOne(num)
    # Write your code here
    return 0 if num == 1
    
    if ( num % 3 == 0)  
        1 + minimumStepsToOne(num / 3) 
    elsif ( num % 2 == 0)
        [
            1 + minimumStepsToOne(num / 2),
            1 + minimumStepsToOne(num - 1)
        ].min
    else
        1 + minimumStepsToOne(num - 1)
    end
end

puts minimumStepsToOne(1234567)
