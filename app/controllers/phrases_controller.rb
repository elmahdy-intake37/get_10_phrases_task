class PhrasesController < ApplicationController

  def home
  end
  def index
    @phrases = Phrase.all
    respond_to do |format|
      format.html
      format.js { }
    end
  end

  def get_10
    arr =  params['arr']
    if arr.nil?
      @rand_record = Phrase.all.sample
    else
      rand_record = Phrase.all.sample
      name = rand_record.name
      new_num = name.scan(/\d/).join('')
      array = arr.map {|x| x[/\d+/]}
      i = 0
      while(array.include?new_num) do
        rand_record = Phrase.all.sample
        name = rand_record.name
        new_num = name.scan(/\d/).join('')
          i+=1
          puts "i = ", i
          if i == 9
            break
          end
        if !array.include?new_num
          @rand_record = rand_record
          return [@rand_record, @array = array.length]
        else
          next
        end
      end
        if !array.include?new_num
          @rand_record = rand_record
          return [@rand_record, @array = array.length]
        end
        return [@rand_record, @array = array.length]
    end

    respond_to do |format|
      format.js { }
    end
  end

  def new
    @phrase = Phrase.new
  end
end
# i = 0
# print("array = ", array)
# while i < array.length
#   puts "array[i]b4 = ", array[i]
#   puts  "new_numb4 = ", new_num
#   print "i = ", i
#   if array[i].include?new_num
#     puts "array[i] = ", array[i]
#     puts  "new_num = ", new_num
#     puts " heereeee"
#     rand_record = Phrase.all.sample
#     i = 0
#   elsif !arr[i].include?new_num
#     @rand_record = Phrase.all.sample
#     return @rand_record
#   end
#   i+=1
# end
# # @rand_record = Phrase.all.sample
# end
