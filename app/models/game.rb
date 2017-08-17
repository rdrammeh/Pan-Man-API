class Game < ApplicationRecord
  belongs_to :user

  validates :score, :end_time, :start_time, :user, presence: true

  def duration
    final = ""
    full_time = (self.end_time - self.start_time).floor
    until full_time == 0
      if full_time >= 3600
        hours = full_time/3600
        final += "#{hours}:"
        full_time -= (hours*3600)
      elsif full_time >= 60
        minutes = full_time/60
        full_time -= (minutes*60)
        final += "#{minutes}:"
        seconds = "00"
        final += "#{seconds}"
      else
        final += "#{full_time}"
      end
    end
    final
  end
end
