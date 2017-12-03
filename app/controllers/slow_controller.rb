def slow_action
  slow_object = Rails.cache.fetch(:slow_object) do 
      create_slow_object
end


