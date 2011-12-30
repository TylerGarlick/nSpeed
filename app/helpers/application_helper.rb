module ApplicationHelper
  def simple_date(date)
    unless date.nil?
      date.localtime.strftime('%m/%d/%Y %I:%M %p')
    end
  end

  def simple_date_no_time(date)
    unless date.nil?
      date.localtime.strftime('%m/%d/%Y')
    end
  end

  def document_type_name(document_type)
    unless document_type.blank?
      Document.get_document_type_values[Document.get_document_type_values.index { |d| d[1] == document_type }][0]
    end
  end

  def user_can_read_resource?(user, resource)
    user_can_access_resource?(user, resource, :read)
  end

  def user_can_write_resource(user, resource)
    user_can_access_resource?(user, resource, :write)
  end

  def user_can_access_resource?(user, resource, mode)
    ((RoleResource.where(:mode => mode).where(:resource_id => resource).map(&:role_id) & user.roles.map(&:id)).length > 0)
  end

end