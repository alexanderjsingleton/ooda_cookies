# Answer These Questions:

# - What are essential classes?
  # cookie, oven, baker
# - What attributes will each class have?
  # cookie - ingredients, cook time, status
  # oven - temp, on/off
# - What interface will each class provide?
  # baker - check_cookies, remove_cookies, turn_oven_on/off, set_oven_temp
  # cookie - ready?
  # oven - on, off, temperature
# - How will the classes interact with each other?
  # baker - check_cookies - loop through cookies in oven and check which are ready in oven
        # - remove_cookies - loop through ready cookies and remove them from oven
# - Which classes will inherit from others, if any?
  # other cookie types will inherit from cookie

# define class Oven
class Oven
# set attr_reader for status temperature contents
  attr_reader :status, :temperature, :contents

# def initialize
  def initialize
    #set instance variable temperature base equal to 0
    @temperature = 0
    #set instance variable status 
    @status = :off
    @contents = []
  end

  def add_items(items_array)
    items_array.each do |item|
      @contents << item
    end
  end

  def remove_item(item)
    puts "taking out #{item}"
    @contents.delete(item)
  end

  def on(temperature)
    set_temperature(temperature)
    @status = :on
    puts "the oven is #{@status} at #{@temperature} degrees fahrenheit"
  end

  def off
    set_temperature(0)
    @status = :off
    puts "the oven is #{@status}"
  end


  private

  def set_temperature(temperature)
    @temperature = temperature
  end
end





class Cookie
  attr_accessor :status

  def initialize(ingredients, cook_time)
    @ingredients = ingredients
    @cook_time = cook_time
    @cooked_for = 0
    @status = :doughy
    @statuses = [:doughy, :almost_ready, :ready, :burned]
  end

  def ready?
    return true if self.status == :ready
  end

  def bake!
    @cooked_for += 1
    set_status
    p "this cookie is #{@status}"
  end

  private

#change state-maybe consider case statement here; as I understand, case statements 
# are preferred or if/else statements if beyond three contingencies.
  def set_status
    if @cooked_for <= @cook_time / 3
      @status = @statuses[0]
      return
    end
    if @cooked_for <= @cook_time / 2
      @status = @statuses[1]
      return
    end
    if @cooked_for == @cook_time
      @status = @statuses[2]
      return
    end
    if @cooked_for > @cook_time
      @status = @statuses[3]
      return
    end
  end
end


class PeanutButterChocolateChipCookie < Cookie
  def initialize
    super(['peanut butter', 'sugar'], 4)
  end
end

class WalterWhiteCookie < Cookie
  def initialize
    super(['blue chocolate chips', 'macadmia nuts'], 10)
  end
end


class Baker
  attr_reader :cookie_tray, :oven, :cookie_jar

  def initialize(oven)
    @oven = oven
    @cookie_tray = []
    @cookie_jar = []
  end

  def make_cookies(cookie_type, n=1)
    puts "the baker makes #{n} #{cookie_type} cookie(s)"
    n.times { @cookie_tray << cookie_type.new }
  end

  def put_cookies_in_oven
    oven.add_items(@cookie_tray)
    puts "the baker puts #{@cookie_tray.length} cookies in the oven"
    while oven.contents.any?
      sleep(1)
      oven.contents.each do |cookie|
        cookie.bake!
      end
      p ' --------------------------------------------- '
      check_cookies(oven.contents)
    end
    @cookie_tray = []
  end

  def check_cookies(oven_contents)
    return if has_ready_cookies?(oven_contents) == false
    oven_contents.each do |cookie|
      if cookie.ready?
        puts "the baker takes a cookie out of the oven"
        @cookie_jar << cookie
        oven_contents.delete(cookie)
      end
      check_cookies(oven.contents)
    end
  end

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
doughboy.make_cookies(WalterWhiteCookie, 10)
doughboy.put_cookies_in_oven
p "I have #{oven.contents.length} cookies in my oven"
doughboy.check_cookies(oven.contents)

doughboy.turn_off_oven
p "I have #{oven.contents.length} cookies in my oven"
p "I have #{doughboy.cookie_jar.length} cookies in my cookie jar"