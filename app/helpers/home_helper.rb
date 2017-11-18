module HomeHelper
  def parse_time_parameter(parameter)
    time = params.dig(:calendar_search, parameter)
    Time.zone.parse(time) if time
  end

  def calendar_search_iso8601(calendar_search)
    calendar_search.map { |k,v| [k,v.iso8601]}.to_h
  end
end
