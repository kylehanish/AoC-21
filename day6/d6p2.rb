require '../input.rb'

@filename = 'd6-input.txt'
lines = Input.get_file_lines(@filename).first.split(',').map(&:to_i)

[80, 256].each do |days|
    # 0 days, 1 day, 2 day...etc up to 8 days
   day_counts = [0,0,0,0,0,0,0,0,0]
   
   # preload data
   lines.each { |n| day_counts[n] += 1}

   days.times do |d| 
       day_counts[7] += day_counts[0] # add the 0's to day 7 ( will be 6 after rotate)
       # will add index 0 new fish with 8 days remaining on rotate
       
       day_counts.rotate!(1) # move first position back to 
   end
   
   puts day_counts.reduce(:+)
end