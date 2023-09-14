class Friend < ApplicationRecord
  belongs_to :user

  def rid
    if self.user_id < self.user_id_2
      x=self.user_id
      y=self.user_id_2
    else
      x=self.user_id_2
      y=self.user_id
    end
    (x*10)+y
  end
end
