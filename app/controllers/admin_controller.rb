class AdminController < ApplicationController
  def load_term_data_form_json
  end

  def load_term_data_from_json_commit

    f=File.new(params[:jsonfile].path(),'r')
    p=f.read
    f.close
    js = JSON.parse(p)
    js.each do |elem|

      sp = ScholarshipPeriod.new
      elem.each do |field, value|
        sp[field] = value
      end
      sp.save
    end
  end

   def load_student_data_form_json
  end

  def load_student_data_from_json_commit

    f=File.new(params[:jsonfile].path(),'r')
    p=f.read
    f.close
    js = JSON.parse(p)
    js.each do |elem|
#if elem["type"]=="Faculty" type добавить в json файл 
# в json файл в один добавить все факультет, группа, студент
      f = Faculty.new
      elem.each do |field, value|
#if field =="type" # то ничего не делать, а иначе 
        f[field] = value
      end
      f.save
    end
  end
end
