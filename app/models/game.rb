class Game < ApplicationRecord
  belongs_to :user
  has_many :moves

  validates :score, :end_time, :start_time, :user, presence: true

  def duration
    final = ""
    full_time = (self.end_time - self.start_time).floor
    until full_time <= 0
      if full_time >= 3600
        hours = full_time/3600
        final += "#{hours}:"
        full_time -= (hours*3600)
      elsif full_time >= 60
        minutes = full_time/60
        full_time -= (minutes*60)
        final += "#{minutes}:"
        if full_time == 0
          seconds = "00"
          final += "#{seconds}"
        end
      else
        final += "#{full_time}"
        full_time -= full_time
      end
    end
    final
  end
end
