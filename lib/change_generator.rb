class ChangeGenerator

  def initialize(pounds_due)
    @pounds_due = pounds_due
    @denominations = [50, 20, 10, 5, 2, 1]
    @change = []
  end

  def separate_pound_and_pence
    @pound_pence = @pounds_due.to_s.split(".")
  end

  def pound_change
    pounds = @pound_pence[0].to_i
    while pounds > 0
      denomination = @denominations.find { |d| pounds >= d }
      @change << "£#{denomination}"
      pounds -= denomination
    end
    @change
  end

  def pence_change
    pence = @pound_pence[1].to_i
    while pence > 0
      denomination = @denominations.find { |d| pence >= d }
      @change << "#{denomination}p"
      pence -= denomination
    end
    @change
  end

  def give_me_the_change
    separate_pound_and_pence
    pound_change
    pence_change
    @change
  end
end
