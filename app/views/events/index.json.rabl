collection @events
attributes :id, :event_name, :start_time, :end_time, :description, :location

node(:title)    { |event| event.event_name }
node(:start)    { |event| event.start_time.to_s(:rfc822) }
node(:end)      { |event| event.end_time.to_s(:rfc822) }
node(:url)      { |event| event_path(event) }

node(:color) do |event|
  event.start_time - 3.days < Time.now ? "#f4a62a" : "#26a65b"
end

node(:view) { |event| event_path(event) }