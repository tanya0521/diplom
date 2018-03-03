# Положить в lib/tasks/
# Запускать: bundle exec rake import:more_periods
namespace :import do
  desc "Добавление периодов к студентам"
  task(:more_periods => :environment) do
    puts "Перевод на следующий семестр"
    sp = ScholarshipPeriod.last
    another_sps = ScholarshipPeriod.where.not(id: sp.id).all
    sp.perform_datums.each do |pd|
      another_sps.each do |asp|
        pd2 = pd.dup
        pd2.scholarship_period = asp
        pd2.quantity5 = pd2.quantity5 + rand(3).to_i - 1
        pd2.quantity4 = pd2.quantity4 + rand(3).to_i - 1
        pd2.quantity3 = pd2.quantity3 + rand(3).to_i - 1
        pd2.save
      end
    end
  end
end
