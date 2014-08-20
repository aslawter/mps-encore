class WordDocumentGenerator
  include ActionView::Helpers::NumberHelper

  def initialize(file_template, performance)
    @file_template = file_template
    @performance = performance
  end

  def generate
    word_template_values = {
      "CUSTOMER NAME" =>  @performance.customer.name,
      "CONTRACT TITLE" =>  @performance.title,
      "PRIMECONTRACTNUMBER" => @performance.contract_number,
      "SUBCONTRACTNUMBER" => @performance.contract_number,
      "MPS VALUE" => number_to_currency(@performance.value),
      "CONTRACT TYPE" => @performance.contract_type,
      "PERIOD START DATE" => @performance.period_start,
      "PERIOD END DATE" => @performance.period_end,

      "C1 FULLNAME" => @performance.contact_with_role("Supervisor").full_name,
      "C1 PHONE" => number_to_phone(@performance.contact_with_role("Supervisor").phone),
      "C1 EMAIL" => @performance.contact_with_role("Supervisor").email,
      "C1 FAX" => number_to_phone(@performance.contact_with_role("Supervisor").fax),
      "C2 FULLNAME" => @performance.contact_with_role("Contracting Officer Technical Representative").full_name,
      "C2 PHONE" => number_to_phone(@performance.contact_with_role("Contracting Officer Technical Representative").phone),
      "C2 EMAIL" => (@performance.contact_with_role("Contracting Officer Technical Representative").email),
      "C2 FAX" => number_to_phone(@performance.contact_with_role("Contracting Officer Technical Representative").fax),

      "COMPANY NAME" => @performance.partner.name,
      "P1 FULLNAME" => @performance.contact_with_role("Company Representative").full_name,
      "P1 PHONE" => number_to_phone(@performance.contact_with_role("Company Representative").phone),
      "P1 EMAIL" => @performance.contact_with_role("Company Representative").email,
      "P1 FAX" => number_to_phone(@performance.contact_with_role("Company Representative").fax),
      "P2 FULLNAME" => @performance.contact_with_role("Other").full_name,
      "P2 PHONE" => number_to_phone(@performance.contact_with_role("Other").phone),
      "P2 EMAIL" => @performance.contact_with_role("Other").email,
      "P2 FAX" => number_to_phone(@performance.contact_with_role("Other").fax),

      "NARRATIVE DESCRIPTION" => @performance.description.gsub("\n", "<w:br/>"),
    }

    word_template_values.each do |template_key, template_value|
      @file_template.sub!(template_key, template_value)
    end

    @file_template
  end
end
