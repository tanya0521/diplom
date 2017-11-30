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
        {:name => 'Добавление',
         :controller => :users, :action => :new,
         :icon => 'user-plus'},
        {:name => 'Информация о финансировании', :controller => :financings,
         :action => :index, :icon => 'file-text-o',
         :class => 'long'},
        {:name => 'Добавление', :controller => :financings,
         :action => :new, :icon => 'plus'},
        {:name => 'Роли', :controller => :roles,
         :action => :index, :icon => 'file-text-o'},
        {:name => 'Добавить роль', :controller => :roles,
         :action => :new, :icon => 'plus'}
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
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s
    else
      false
    end
  end
end
