json.extract! order_line, :id, :begin_date, :end_date, :scholarship, :student_id, :order_id, :scholarship_period_id, :type_scholarship_id, :created_at, :updated_at
json.url order_line_url(order_line, format: :json)
