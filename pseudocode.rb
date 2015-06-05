# Answer These Questions:

# - What are essential classes?
# - What attributes will each class have?
# - What interface will each class provide?
# - How will the classes interact with each other?
# - Which classes will inherit from others, if any?



# define class Oven

# set attr_reader for status temperature contents

# def initialize
  
    #set instance variable attribute temperature base equal to 0
    
    #set instance variable attribute status set to attribute off
    
    # set contents equal to empty array

  #end method

  # define method add_items requiring parameter items_array
  
    #chain enumerable .each to items_array argument run block treatting each element/index as "item"
   
      # for each item chevron into instance variable attribute contents
   
      # end block
   
      # end method
  

  # define remove_item method requiring single-parameter item
  
  # puts string interpolation for single-parameter item
  
    #return contents array to .delete single-parameter item
  
  # end method


  # define method on requiring single-parameter temperature
  
  # return set_temperature method to accept single-parameter temperature
  
  # set instance variable attribute to :on to change oven class sttate
  
  # puts statement with string interpolations of instance variable attributes of status and temperature
  
  # end method
  

  # define off method
  
  # return set_temperature method to parameter 0
  
  # return instance variable status to :off
 
  # puts interpolation of instance variable status state
 
  # end
 

  # private method
 

  # define set_temperature method to parameter temperature
 
  # return instance variable to parameter temperature
 
  # end method 

  # end class





# define class Cookie

# set attribute accessor to status


# initialize cookie class with two parameters-ingredients, cook_time
  
# set instance variable ingredient 
  
# set instance cook_time
  
# set cooked_for to 0
  
# set status to attribute to default doughy
  
  # set statuses instane variable to array to attributes, dough-almost_ready-ready-burned
  
  # end initialize
  

#define method ready?
  
# return true if self.status == state ready
  
# end method ready?
  

# define destructive bake method 
  
# set instanve variable @ cooked_for to increment by 1
  
# return set status
  
# print string interpolation @status
  
# end destructive bake method
  

#privatize
 

#change state-maybe consider case statement here; as I understand, case statements 
# are preferred or if/else statements if beyond three contingencies.
  # define set status method to change state of cook times
 
  # if instanve variable @cooked_for is <= @cook_time / 3
 
    # return status @state[0] (remember the array of atributes)
 
    # return 
 
    # end if
 
    # if @cooked_for <= cook_time / 2
 
    # return status @ state[1]
 
    # return
  
    # end if
 
    # if @cooked_for == cook_time
  
    # return status state @instance variable to position 2
   
    # return
   
    # end if
 
    # if @cooked_for instanve variable is greater than instance variable @cook_time
 
    # return status instance variable set to equal status @instance variable to position 3
 
    # return status
 
    #end if
 
    #end set_status
 

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


#create class for cookie inheriting Cookie class characteristics

# initialize method

# supersede class with pararmeter array of ingredients enclosed within array, quanity 

# end initialize

# end class



# define Baker class

 

# initialize class requiring single parameter ove
 
# create instance variable oven set to oven
 
# create instance variable cookie_tray set to empty array
 
# create instance variable cookie_jar set to empty array
 
# end class
 

# define make cookies method requiring two arguments cookie_type and n defaulting quantity to 1
  
# puts string interpolation of quantity of cookes and cookie type

# n.times do accepting block of initializing cookie_type into empty cookie_tray array
   
# end method
  

#define put_cookies_in oven method
 
# chain oven instance variable oven to add_items method requiring parameter of instanace variable cookie tray
 
  # puts string interpolation denote cooktray number with .length enumerable
 
  # set while loop of instance variable oven chained to method contents.any? methods
  
    # return sleep function by 1
   
    # set instance variable oven chained to contents and each for block treating each cookie as element/index as cookie
  
    # return cookie destructive method bake
   
    # end block
  
      # print demarcation
  
      # return check_cookies calling argument of method oven chained to contents
  
    #end while loop
  
    # return cookie_tray
  
    # end put cookies_in_oven


#define check_cookies method accpeting oven_contents argument

# return if statement of local variable check? requiring single argument paramter(oven _contents) is false
 
# if true for oven_content each enumerable accepting block treating each element as cookie
 
  # run if loop if cookie.ready?
  # if cookie element cookie is ready
 
      # puts indication with string interpolation
 
      # chevron cookie element into cookie_jar containter []
 
      # return oven_contents argument chained to delete cookie element
 
      # end

      # return check_cookies method requiring single argument oven chained to contents array
  
    #end if statement
  
    #end method
 

# define method had_ready_cookies accepting parameters cookies
  
# set local variable ready_cookies to equal oven array chained to contents array with enumerable select passing block treating each element as cookie with .ready? true/false
  
  # return true/false if ready_cookies.empty returns true
  
  # else return true
  
  # method
 

# define turn_on_oven method requiring single parameter temperature
 
  #return oven instance variable chained with attribute state requiring single argument temperature
  
  # end method
 

# define turn_off_oven method
 
# return oven instance chained to attribute state off

# end method

#end class


