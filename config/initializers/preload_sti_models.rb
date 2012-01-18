if Rails.env.development?
  %w[list list_item unordered_list ordered_list accumulator_list unordered_list_item ordered_list_item accumulator_list_item].each do |c|
    require_dependency File.join("app","models","#{c}.rb")
  end
end

