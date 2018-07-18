class ChangeGenerator
#  attr_reader :pound_pence

  def initialize(pounds_due)
    @pounds_due = pounds_due
    @pound_denominations = [50, 20, 10, 5, 2, 1]
    @pence_denominations = [0.50, 0.20, 0.10, 0.05, 0.02, 0.01]
    @pounds_array = []
  end

  def separate_pounds_and_pence
    @pound_pence = @pounds_due.to_s.split(".")
  end

  def pound_change
    pounds = @pound_pence[0].to_i
    @pound_denominations.each do |d|
      if pounds >= d
        @pounds_array << "£#{d}"
        pounds -= d
      end
    end
    @pounds_array
  end
end
