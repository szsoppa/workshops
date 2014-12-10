class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create
    super
    if resource.save
      list = List.new
      list.user_id = resource.id
      list.save
    end
  end

  def destroy
    super
    if resource.destroy
      list = List.find_by(user_id: resource.id)
      # if list.products.any?
      #   list.products.each do |p|
      #     p.
      #   end
      # end
      list.destroy
    end
  end
end
