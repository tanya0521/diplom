module SideBarHelper
  def side_bar_items(ru)
    result = []
    if ru.nil?
      result << {:name => 'Финансировние', 
        :controller => :financings , :action => :index,
        :icon => 'financing'}
      else
    if ru.is_admin?
      result << {
        :name => 'Администрирование',
        :icon => 'gears',
        :children => [
        {:name => 'Пользователи',
        :controller => :users, :action => :index,
        :icon => 'user',
        :class => 'long'},
        {:name => 'Роли', :controller => :roles,
        :action => :index, :icon => 'vcard-o'}
      ]}
      result << {
        :name => 'Контингент',
        :icon => 'address-card',
        :children => [
        {:name => 'Студенты', :controller => :students,
        :action => :index, :icon => 'graduation-cap',
        :class => 'long'},
        {:name => 'Группы', :controller => :groups,
        :action => :index, :icon => 'users',
        :class => 'long'},
        {:name => 'Успеваемость', :controller => :perform_data,
        :action => :index, :icon => 'check-circle',
        :class => 'long'},
        {:name => 'Факультеты', :controller => :faculties,
        :action => :index, :icon => 'university',
        :class => 'long'}]}
      result << {
        :name => 'Стипендии',
        :icon => 'money',
        :children => [
        {:name => 'Финансирование', :controller => :financings,
        :action => :index, :icon => 'dollar',
        :class => 'long'},
        {:name => 'Приказы', :controller => :orders,
        :action => :index, :icon => 'file',
        :class => 'long'},
        {:name => 'Создать новый приказ', :controller => :orders,
        :action => :index, :icon => 'edit',
        :class => 'long'}

      ]}


      result << {
        :name => 'Словари',
        :icon => 'book',
        :children => [
        {:name => 'Виды стипендий', :controller => :type_scholarships,
        :action => :index, :icon => 'money',
        :class => 'long'},
        {:name => 'Периоды стипендий', :controller => :scholarship_periods,
        :action => :index, :icon => 'calendar',
        :class => 'long'}
      ]}
      result << {
        :name => 'Импорт данных',
        :icon => 'plus',
        :children => [
        {:name => 'Основной импорт', 
        :controller => :admin, :action => :load_student_data_form_json, 
        :icon => 'list'},
        {:name => 'Импорт периодов', 
        :controller => :admin, :action => :load_term_data_form_json, 
        :icon => 'calendar-plus-o'}
      ]} 
   else
     if ru.is_operator?
      result << {
        :name => 'Контингент',
        :icon => 'users',
        :children => [
        {:name => 'Студенты', :controller => :students,
        :action => :index, :icon => 'info',
        :class => 'long'},
        {:name => 'Группы', :controller => :groups,
        :action => :index, :icon => 'info',
        :class => 'long'},
        {:name => 'Успеваемость', :controller => :perform_data,
        :action => :index, :icon => 'info',
        :class => 'long'},
        {:name => 'Факультеты', :controller => :faculties,
        :action => :index, :icon => 'info',
        :class => 'long'}]}
      result << {
        :name => 'Стипендии',
        :icon => 'money',
        :children => [
        {:name => 'Финансирование', :controller => :financings,
        :action => :index, :icon => 'info',
        :class => 'long'},
        {:name => 'Приказы', :controller => :orders,
        :action => :index, :icon => 'info',
        :class => 'long'},
        {:name => 'Создать новый приказ', :controller => :orders,
        :action => :index, :icon => 'info',
        :class => 'long'}
      ]}
      result << {
        :name => 'Словари',
        :icon => 'book',
        :children => [
        {:name => 'Виды стипендий', :controller => :type_scholarships,
        :action => :index, :icon => 'info',
        :class => 'long'},
        {:name => 'Периоды стипендий', :controller => :scholarship_periods,
        :action => :index, :icon => 'info',
        :class => 'long'}
      ]}
      result << {
        :name => 'Импорт данных',
        :icon => 'plus',
        :children => [
        {:name => 'Основной импорт', 
        :controller => :admin, :action => :load_student_data_form_json, 
        :icon => 'pencil-square-o'},
        {:name => 'Импорт периодов', 
        :controller => :admin, :action => :load_term_data_form_json, 
        :icon => 'calendar-plus-o'}
      ]}

   end
   end
   end  
   end

  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles', 'admin', 'financings', 'orders', 'students',  'faculties' ,'groups', 'order_lines', 'type_scholarships', 'scholarship_periods', 'perform_data'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
