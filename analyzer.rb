stopwords = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join

#count the characters
total_characters = text.length
total_characters_nospaces = text.gsub(/\s+/, '').length

#count the words, sentences and paragraphs
word_count = text.split.length
paragraph_count = text.split(/\n\n/).length
sentence_count = text.split(/\.|\?|!/).length

#make a list of words in the text that aren't stop words,
#count them, and work out the percentage of non-stop words
#against all words
all_words = text.split
good_words = all_words.select { |word| !stopwords.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i

#summarize the text by cherry picking some choice sentences
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/}

#give analysis back to the user
puts "#{line_count} lines"
puts "#{total_characters} characters"
puts "#{total_characters_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
#average number of sentences per paragraph
puts "#{sentence_count / paragraph_count} sentences per paragraph"
#average number of words per sentence
puts "#{word_count / sentence_count} words per sentence"
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary: \n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
puts good_words.length
puts all_words.length