# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?



# define class Oven
class Oven
# set attr_reader for status temperature contents
  attr_reader :status, :temperature, :contents

# def initialize
  def initialize
    #set instance variable attribute temperature base equal to 0
    @temperature = 0 
    #set instance variable attribute status set to attribute off
    @status = :off
    # set contents equal to empty array
    @contents = []
  end

  # define method add_items requiring parameter items_array
  def add_items(items_array)
    #chain enumerable .each to items_array argument run block treatting each element/index as "item"
    items_array.each do |item|
      # for each item chevron into instance variable attribute contents
      @contents << item
      # end block
    end
      # end method
  end

  # define remove_item method requiring single-parameter item
  def remove_item(item)
  # puts string interpolation for single-parameter item
    puts "taking out #{item}"
    #return contents array to .delete single-parameter item
    @contents.delete(item)
  # end method
  end

  # define method on requiring single-parameter temperature
  def on(temperature)
  # return set_temperature method to accept single-parameter temperature
    set_temperature(temperature)
  # set instance variable attribute to :on to change oven class sttate
    @status = :on
  # puts statement with string interpolations of instance variable attributes of status and temperature
    puts "the oven is #{@status} at #{@temperature} degrees fahrenheit"
  # end method
  end

  # define off method
  def off
  # return set_temperature method to parameter 0
    set_temperature(0)
  # return instance variable status to :off
    @status = :off
  # puts interpolation of instance variable status state
    puts "the oven is #{@status}"
  # end
  end

  # private method
  private

  # define set_temperature method to parameter temperature
  def set_temperature(temperature)
  # return instance variable to parameter temperature
    @temperature = temperature
  # end method 
  end
  # end class
end




# define class Cookie
class Cookie
# set attribute accessor to status
  attr_accessor :status

# initialize cookie class with two parameters-ingredients, cook_time
  def initialize(ingredients, cook_time)
# set instance variable ingredient 
    @ingredients = ingredients
# set instance cook_time
    @cook_time = cook_time
# set cooked_for to 0
    @cooked_for = 0
# set status to attribute to default doughy
    @status = :doughy
  # set statuses instane variable to array to attributes, dough-almost_ready-ready-burned
    @state = [:doughy, :almost_ready, :ready, :burned]
  # end initialize
  end

#define method ready?
  def ready?
# return true if self.status == state ready
    return true if self.status == :ready
# end method ready?
  end

# define destructive bake method 
  def bake!
# set instanve variable @ cooked_for to increment by 1
    @cooked_for += 1
# return set status
    set_status
# print string interpolation @status
    p "this cookie is #{@status}"
# end destructive bake method
  end

#privatize
  private

#change state-maybe consider case statement here; as I understand, case statements 
# are preferred or if/else statements if beyond three contingencies.
  # define set status method to change state of cook times
  def set_status
  # if instanve variable @cooked_for is <= @cook_time / 3
    if @cooked_for <= @cook_time / 3
    # return status @state[0] (remember the array of atributes)
      @status = @state[0]
    # return 
      return
    # end if
    end
    # if @cooked_for <= cook_time / 2
    if @cooked_for <= @cook_time / 2
    # return status @ state[1]
      @status = @state[1]
    # return
      return
    # end if
    end
    # if @cooked_for == cook_time
    if @cooked_for == @cook_time
    # return status state @instance variable to position 2
      @status = @state[2]
    # return
      return
    # end if
    end
    # if @cooked_for instanve variable is greater than instance variable @cook_time
    if @cooked_for > @cook_time
    # return status instance variable set to equal status @instance variable to position 3
      @status = @state[3]
    # return status
      return
    #end if
    end
    #end set_status
  end

  # def set_status
  #   case status
  #   when @cooked_for <= @cook_time / 3
  #     @status = @state[0]
  #     return
  #   end
  #   when @cooked_for <= @cook_time / 2
  #     @status = @state[1]
  #     return
  #   end
  #   when @cooked_for == @cook_time
  #     @status = @state[2]
  #     return
  #   end
  #   when  @cooked_for > @cook_time
  #     @status = @state[3]
  #     return
  #   end
  # end
end

#create class for cookie inheriting Cookie class characteristics
class PeanutButterChocolateChipCookie < Cookie
# initialize method
  def initialize
# supersede class with pararmeter array of ingredients enclosed within array, quanity 
    super(['peanut butter', 'chococlate_chips', 'sugar'], 4)
# end initialize
  end
# end class
end


# define Baker class
class Baker
# set attribute readers to cookie_tray, oven, cookie_jar
  attr_reader :cookie_tray, :oven, :cookie_jar

# initialize class requiring single parameter ove
  def initialize(oven)
# create instance variable oven set to oven
    @oven = oven
# create instance variable cookie_tray set to empty array
    @cookie_tray = []
# create instance variable cookie_jar set to empty array
    @cookie_jar = []
# end class
  end

# define make cookies method requiring two arguments cookie_type and n defaulting quantity to 1
  def make_cookies(cookie_type, n=1)
# puts string interpolation of quantity of cookes and cookie type
    puts "the baker makes #{n} #{cookie_type} cookie(s)"
# n.times do accepting block of initializing cookie_type into empty cookie_tray array
    n.times { @cookie_tray << cookie_type.new }
# end method
  end

#define put_cookies_in oven method
  def put_cookies_in_oven
# chain oven instance variable oven to add_items method requiring parameter of instanace variable cookie tray
    oven.add_items(@cookie_tray)
  # puts string interpolation denote cooktray number with .length enumerable
    puts "the baker puts #{@cookie_tray.length} cookies in the oven"
  # set while loop of instance variable oven chained to method contents.any? methods
    while oven.contents.any?
    # return sleep function by 1
      sleep(1)
    # set instance variable oven chained to contents and each for block treating each cookie as element/index as cookie
      oven.contents.each do |cookie|
    # return cookie destructive method bake
        cookie.bake!
    # end block
      end
      # print demarcation
      p ' --------------------------------------------- '
      # return check_cookies calling argument of method oven chained to contents
      check_cookies(oven.contents)
    #end while loop
    end
    # return cookie_tray
    @cookie_tray = []
    # end put cookies_in_oven
  end

#define check_cookies method accpeting oven_contents argument
  def check_cookies(oven_contents)
# return if statement of local variable check? requiring single argument paramter(oven _contents) is false
    return if has_ready_cookies?(oven_contents) == false
# if true for oven_content each enumerable accepting block treating each element as cookie
    oven_contents.each do |cookie|
  # run if loop if cookie.ready?
  # if cookie element cookie is ready
      if cookie.ready?
      # puts indication with string interpolation
        puts "the baker takes a cookie out of the oven"
      # chevron cookie element into cookie_jar containter []
        @cookie_jar << cookie
      # return oven_contents argument chained to delete cookie element
        oven_contents.delete(cookie)
      end
      # return check_cookies method requiring single argument oven chained to contents array
      check_cookies(oven.contents)
    #end if statement
    end
    #end method
  end

# define method had_ready_cookies accepting parameters cookies
  def has_ready_cookies?(cookies)

    ready_cookies = oven.contents.select { |cookie| cookie.ready? }

    return false if ready_cookies.empty?

    true

  end


  def turn_on_oven(temperature)

    oven.on(temperature)

  end


  def turn_off_oven

    oven.off

  end

end


oven = Oven.new
doughboy = Baker.new(oven)

doughboy.turn_on_oven(400)
p "I have #{oven.contents.length} cookies in my oven"
doughboy.make_cookies(PeanutButterChocolateChipCookie, 5)

doughboy.put_cookies_in_oven
p "I have #{oven.contents.length} cookies in my oven"
doughboy.check_cookies(oven.contents)

doughboy.turn_off_oven
p "I have #{oven.contents.length} cookies in my oven"
p "I have #{doughboy.cookie_jar.length} cookies in my cookie jar"p