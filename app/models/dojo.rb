class Dojo < ActiveRecord::Base
    validates :branch, :street, :city, :state, presence: true
    validates :state, length: { is: 2 }
    before_validation :upper_state
    def upper_state
        self.state.upcase!
    end
end
