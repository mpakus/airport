class TimetableService

  def request_for(when_it, direction)
    # timetable = Timetable.where(when_it: when_it).where(direction: direction).where('DATE(created_at) = ?', Date.today).first
    timetable = get_tablo(when_it, direction)
    tablo     = TabloService.new
    info      = tablo.send("get_#{direction}_#{when_it}".to_sym)
    unless info.empty?
      timetable = Timetable.create(when_it: when_it, direction: direction) if timetable.nil?
      timetable.schedule = info
      timetable.save
      return true
    end
    false
  end

  def get_tablo(when_it, direction)
    Timetable.where(when_it: when_it).where(direction: direction).where('DATE(created_at) = ?', Date.today).first
  end

  def get_schedule(when_it, direction)
    tablo = get_tablo(when_it, direction)
    YAML.load(tablo.schedule)
  end

end
