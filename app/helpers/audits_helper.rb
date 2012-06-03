module AuditsHelper
  
  def audit_progress(audit)
    
    cloning_class = ""
    parsing_class = ""
    auditing_class = ""
    case audit.status_id
    when Audit::Status.cloning
      cloning_class = "in_progress"
    when Audit::Status.queued_for_parsing
      cloning_class = "completed"
    when Audit::Status.parsing
      cloning_class = "completed"
      parsing_class = "in_progress"
    when Audit::Status.queued_for_auditing
      cloning_class = "completed"
      parsing_class = "completed"
    when Audit::Status.auditing
      cloning_class = "completed"
      parsing_class = "completed"
      auditing_class = "in_progress"
    when Audit::Status.completed
      cloning_class = "completed"
      parsing_class = "completed"
      auditing_class = "completed"
    end
  
    content_tag :div, class: 'audit_progress' do
      content_tag(:div, 'Cloning', class: "cloning #{cloning_class}") +
      content_tag(:div, 'Parsing', class: "parsing #{parsing_class}") +
      content_tag(:div, 'Auditing', class: "auditing #{auditing_class}") 
    end
  end
end
