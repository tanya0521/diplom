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
        :icon => 'key',
        :children => [
        {:name => 'Пользователи',
         :controller => :users, :action => :index,
         :icon => 'file-text-o',
         :class => 'long'},
        {:name => 'Роли', :controller => :roles,
         :action => :index, :icon => 'info'},
        {:name => 'Финансирование', :controller => :financings,
         :action => :index, :icon => 'info',
         :class => 'long'},
        {:name => 'Приказы', :controller => :orders,
         :action => :index, :icon => 'info',
         :class => 'long'},
        {:name => 'Студенты', :controller => :students,
         :action => :index, :icon => 'info',
         :class => 'long'},
        {:name => 'Факультеты', :controller => :faculties,
         :action => :index, :icon => 'info',
         :class => 'long'},
        {:name => 'Группы', :controller => :groups,
         :action => :index, :icon => 'info',
         :class => 'long'},
        {:name => 'Строки приказов', :controller => :order_lines,
         :action => :index, :icon => 'info',
         :class => 'long'},
        {:name => 'Виды стипедий', :controller => :type_scholarships,
         :action => :index, :icon => 'info',
         :class => 'long'},
        {:name => 'Периоды стипендий', :controller => :scholarship_periods,
         :action => :index, :icon => 'info',
         :class => 'long'},
        {:name => 'Успеваемость', :controller => :perform_data,
         :action => :index, :icon => 'info',
         :class => 'long'},
        {:name => 'Основной импорт', 
         :controller => :admin, :action => :load_student_data_form_json, 
         :icon => 'pencil-square-o'},
        {:name => 'Импорт периодов', 
         :controller => :admin, :action => :load_term_data_form_json, 
         :icon => 'calendar-plus-o'}
     ]}
   else
     if ru.is_operator?
    result << {
      :name => 'Финансирование',
      :icon => 'users', :class => 'long',
      :children => [
      {:name => 'Добавить',
       :icon => 'plus',
       :controller => :financings, :action => :new,},
      {:name => 'вид стипендии', :icon => 'briefcase', :controller => :type_scholarships, :action => :index,},
      {:name => 'Студенты', :icon => 'archive', :controller => :students, :action => :index,},
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
