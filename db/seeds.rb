
(1..10).each do |task|
  Task.create(content: 'サンプル' + number.to_s, status: 'status' + number.to_s)
end