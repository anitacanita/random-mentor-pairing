require 'csv'

# replace `path/to/file.csv` with the .csv file to be used
mentor_mentee = CSV.read('path/to/file.csv')

juniors = []
seniors = []

mentor_mentee.each_with_index do |row, i|
  juniors << row[0..2]
  seniors << row[3..5]
end

def random_pairs(juniors, seniors)
  shuffled_seniors = seniors.shuffle
  shuffled_juniors = juniors.shuffle
  shuffled_juniors.zip(shuffled_seniors)
end

CSV.open('random_mentor_pairing.csv', 'w') do |csv|
  random_pairs(juniors,seniors).each {|pair| csv << pair.flatten}
end
