class TestBoardRepository
  class << self
    attr_accessor :should_save

    should_save = true

    def slug_taken?(slug)
    end

    def examples
      []
    end
  end

  def initialize(*args)
  end

  def save
    self.class.should_save
  end
end
