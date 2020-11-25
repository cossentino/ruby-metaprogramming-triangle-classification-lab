require 'pry'

class Triangle

  attr_accessor :l1, :l2, :l3, :sides, :sides_arrays
  

  def initialize(l1,l2,l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
    @sides_arrays = [[@l1, @l2, @l3], [@l2, @l3, @l1], [@l3, @l2, @l1], [@l3, @l1, @l2]]
    @sides = [@l1, @l2, @l3]
  end



  def valid?
    flag = true
    [@l1, @l2, @l3].each {|side| side > 0 ? next : flag = false}
    @sides_arrays.each do |side_array|
      if side_array[0] + side_array[1] <= side_array[2]
        flag = false
      end
    end
    flag
  end


  def kind
    if !valid?
      raise TriangleError
    else
      if @l1 == @l2 && @l2 == @l3
        :equilateral
      elsif (@l1 == @l2 && @l1 != @l3) || (@l2 == @l3 && @l1 != @l3) || (@l1 == @l3 && @l2 != @l3)
        :isosceles
      else
        :scalene
      end
    end
  end


  class TriangleError < StandardError
  end

    


end


bob = Triangle.new(2,2,2)

#binding.pry