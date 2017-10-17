json.extract! student, :id, :fn, :sn, :ln, :birthday, :course, :faculty_id, :group_id, :created_at, :updated_at
json.url student_url(student, format: :json)
