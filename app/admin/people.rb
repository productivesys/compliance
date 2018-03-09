ActiveAdmin.register Person do
  actions :all, except: [:destroy]

  action_item only: %i(show edit) do
    link_to 'Add Person Information', new_issue_path
  end

  show do
    attributes_table do
      row :id
      row :created_at
      row :updated_at
      row :enabled
    end
    
    if person.natural_dockets.any?
      panel 'Natural Docket', class:'natural_docket' do
        table_for person.natural_dockets.current do |n|
          n.column("ID") do |docket|
            link_to(docket.id, natural_docket_path(docket))
          end
          n.column("First Name")      { |docket| docket.first_name }
          n.column("Last Name")       { |docket| docket.last_name }
          n.column("Birthdate")       { |docket| docket.birth_date }
          n.column("Nationality")     { |docket| docket.nationality }
          n.column("Gender")          { |docket| docket.gender }
          n.column("Marital Status")  { |docket| docket.marital_status }
          n.column("Attachments") do |docket|
            docket.attachments
              .map{|a| link_to a.document_file_name, a.document.url, target: '_blank'}
              .join("<br />").html_safe
          end
          n.column("") { |docket|
            link_to("View", natural_docket_path(docket))
          }
          n.column("") { |docket|
            link_to("Edit", edit_natural_docket_path(docket))
          }
        end
      end
    end
  
    if person.legal_entity_dockets.any?
      panel 'Legal Entity Docket', class: 'legal_entity_docket' do
        table_for person.legal_entity_dockets.current do |l|
          l.column("ID") do |docket|
            link_to(docket.id, legal_entity_docket_path(docket))
          end
          l.column("Industry")             { |docket| docket.industry }
          l.column("Business Description") { |docket| docket.business_description }
          l.column("Country")              { |docket| docket.country }
          l.column("Commercial Name")      { |docket| docket.commercial_name }
          l.column("Legal Name")           { |docket| docket.legal_name }
          l.column("Attachments") do |docket|
            docket.attachments
              .map{|a| link_to a.document_file_name, a.document.url, target: '_blank'}
              .join("<br />").html_safe
          end
          l.column("") { |docket|
            link_to("View", legal_entity_docket_path(docket))
          }
          l.column("") { |docket|
            link_to("Edit", edit_legal_entity_docket_path(docket))
          }
        end
      end
    end
  
    if person.identifications.any?
      panel 'Identification' , class: 'identifications'do
        table_for person.identifications.current do |i|
          i.column("ID") do |identification|
            link_to(identification.id, identification_path(identification))
          end
          i.column("Kind")    { |identification| identification.kind }
          i.column("Number")  { |identification| identification.number }
          i.column("Issuer")  { |identification| identification.issuer }
          i.column("Attachments") do |identification|
            identification.attachments
              .map{|a| link_to a.document_file_name, a.document.url, target: '_blank'}
              .join("<br />").html_safe
          end
          i.column("") { |identification|
            link_to("View", identification_path(identification))
          }
          i.column("") { |identification|
            link_to("Edit", edit_identification_path(identification))
          }
        end
      end
    end
  
    if person.domiciles.any?
      panel 'Domiciles', class: 'domiciles' do
        table_for person.domiciles.current do |d|
          d.column("ID") do |domicile|
            link_to(domicile.id, domicile_path(domicile))
          end
          d.column("Country")         { |domicile| domicile.country }
          d.column("State")           { |domicile| domicile.state }
          d.column("City")            { |domicile| domicile.city }
          d.column("Street Address")  { |domicile| domicile.street_address }
          d.column("Street Number")   { |domicile| domicile.street_number }
          d.column("Postal Code")     { |domicile| domicile.postal_code }
          d.column("Floor")           { |domicile| domicile.floor}
          d.column("Apartment")       { |domicile| domicile.apartment }
          d.column("Attachments") do |domicile|
            domicile.attachments
              .map{|a| link_to a.document_file_name, a.document.url, target: '_blank'}
              .join("<br />").html_safe
          end
          d.column("") { |domicile|
            link_to("View", domicile_path(domicile))
          }
          d.column("") { |domicile|
            link_to("Edit", edit_domicile_path(domicile))
          }
        end
      end
    end
  
    if person.allowances.any?
      panel 'Allowances' , class: 'allowances' do
        table_for person.allowances.current do |q|
          q.column("ID") do |allowance|
            link_to(allowance.id, allowance_path(allowance))
          end
          q.column("Weight") { |allowance| allowance.weight }
          q.column("Amount") { |allowance| allowance.amount }
          q.column("Kind")   { |allowance| allowance.kind }
          q.column("Attachments") do |allowance|
            allowance.attachments
              .map{|a| link_to a.document_file_name, a.document.url, target: '_blank'}
              .join("<br />").html_safe
          end
          q.column("") { |allowance|
            link_to("View", allowance_path(allowance))
          }
          q.column("") { |allowance|
            link_to("Edit", edit_allowance_path(allowance))
          }
        end
      end
    end
  end
end
