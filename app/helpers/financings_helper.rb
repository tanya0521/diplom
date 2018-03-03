module FinancingsHelper
  def faculties_options()
    Faculty.all.map{ |f| [f.namef, f.id] }
  end

  def faculties_options2()
    ScholarshipPeriod.all.map{ |f| ["#{f.begin} — #{f.end}", f.id] }
  end

  def faculties_options3()
    TypeScholarship.all.map{ |f| [f.name_financing, f.id] }
  end
end
