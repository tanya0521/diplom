module OrderLinesHelper
  def orderlines_options()
    Student.all.map{ |f| ["#{f.ln} #{f.fn} #{f.sn}", f.id] }
  end

  def orderlines_options2()
    Order.all.map{ |f| [f.number, f.id] }
  end

  def orderlines_options3()
    ScholarshipPeriod.all.map{ |f| ["#{f.begin} — #{f.end}", f.id] }
  end

  def orderlines_options4()
    TypeScholarship.all.map{ |f| [f.name_financing, f.id] }
  end
end
