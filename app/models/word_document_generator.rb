class WordDocumentGenerator
  def initialize(file_template, performance)
    @file_template = file_template
    @performance = performance
  end

  def generate
    @file_template.sub!("[CUSTOMER NAME]", @performance.customer.name)
    @file_template.sub!("[CONTRACT TITLE]", @performance.title)
    @file_template.sub!("[PRIME CONTRACT NUMBER]", @performance.contract_number)
    @file_template.sub!("[SUB CONTRACT NUMBER]", @performance.contract_number)
    @file_template.sub!("[MPS VALUE]", @performance.value.to_s)
    @file_template.sub!("[CONTRACT TYPE]", @performance.contract_type)
    @file_template.sub!("[PERIOD START DATE]", @performance.period_start)
    @file_template.sub!("[PERIOD END DATE]", @performance.period_end)

    @file_template.sub!("[C1 FULLNAME]", @performance.contact_with_role("Supervisor").full_name)
    @file_template.sub!("[C1 PHONE]", @performance.contact_with_role("Supervisor").phone)
    @file_template.sub!("[C1 EMAIL]", @performance.contact_with_role("Supervisor").email)
    @file_template.sub!("[C1 FAX]", @performance.contact_with_role("Supervisor").fax)
    @file_template.sub!("[C2 FULLNAME]", @performance.contact_with_role("Contracting Officer Technical Representative").full_name)
    @file_template.sub!("[C2 PHONE]", @performance.contact_with_role("Contracting Officer Technical Representative").phone)
    @file_template.sub!("[C2 EMAIL]", @performance.contact_with_role("Contracting Officer Technical Representative").email)
    @file_template.sub!("[C2 FAX]", @performance.contact_with_role("Contracting Officer Technical Representative").fax)

    @file_template.sub!("[COMPANY NAME]", @performance.partner.name)
    @file_template.sub!("[P1 FULLNAME]", @performance.contact_with_role("Company Representative").full_name)
    @file_template.sub!("[P1 PHONE]", @performance.contact_with_role("Company Representative").phone)
    @file_template.sub!("[P1 EMAIL]", @performance.contact_with_role("Company Representative").email)
    @file_template.sub!("[P1 FAX]", @performance.contact_with_role("Company Representative").fax)
    @file_template.sub!("[P2 FULLNAME]", @performance.contact_with_role("Other").full_name)
    @file_template.sub!("[P2 PHONE]", @performance.contact_with_role("Other").phone)
    @file_template.sub!("[P2 EMAIL]", @performance.contact_with_role("Other").email)
    @file_template.sub!("[P2 FAX]", @performance.contact_with_role("Other").fax)

    @file_template.sub!("[NARRATIVE DESCRIPTION]", @performance.description)

    @file_template
  end
end
