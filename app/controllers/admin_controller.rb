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
    fs = js[0]
    gs = js[1]
    ss = js[2]
    ps = js[3]
    fs.each do |elem|
#0
      sp = Faculty.new
      elem.each do |field, value|
        sp[field] = value
      end
      sp.save
    end
#1
    gs.each do |elem|

      sp = Group.new
      elem.each do |field, value|
        if field=="faculty" or field==:faculty
          sp.faculty=Faculty.where(namef: value).first
        else 
          sp[field] = value
        end
      end
      sp.save
    end
#2      
    ss.each do |elem|

      sp = Student.new
      elem.each do |field, value|
        if field=="group" or field==:group
          sp.group=Group.where(numberg: value).first
        elsif field=="faculty" or field==:faculty
          sp.faculty=Faculty.where(namef: value).first
        else 
          sp[field] = value
        end
      end
      sp.save
    end
#3
    ps.each do |elem|

      sp = PerformDatum.new
      elem.each do |field, value|
        if field=="begin" or field==:begin
          sp.scholarship_period=ScholarshipPeriod.where("begin"=> value).first
        elsif field=="student" or field==:student
          sp.student=Student.where(namberg: value).first
        elsif field=="fn" or field==:fn
          @fn = value
        elsif field=="sn" or field==:sn
          @sn = value
        elsif field=="ln" or field==:ln
          @ln = value
        elsif field=="birthday" or field==:birthday
          @birthday = value
        elsif field=="faculty" or field==:faculty
          @faculty = Faculty.where(namef: value).first
        elsif field=="group" or field==:group
          @group = Group.where(numberg: value).first
        elsif field=="course" or field==:course
          @course = value
        else 
          sp[field] = value
        end
      end
      sp.student = Student.where(fn: @fn, sn: @sn, ln: @ln, birthday: @birthday, faculty: @faculty, group: @group, course: @course).first
#raise Student.where(fn: @fn, sn: @sn, ln: @ln, birthday: @birthday, #faculty: @faculty, group: @group, course: @course).to_sql
      sp.save
#raise sp.errors.inspect
    end
end
end







