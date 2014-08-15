class WordDocumentGenerator
  def initialize(performance, customer, performance_contact, contact, partner)
  end

  def generate
    a_giant_string = #something
    a_giant.string.sub!("[CUSTOMER NAME]", @performance.customer.name)
    a_giant.string.sub!("[CONTRACT TITLE]", @performance.title)
    a_giant.string.sub!("[PRIME CONTRACT NUMBER]", @performance.contract_number)
    a_giant.string.sub!("[SUB CONTRACT NUMBER]", @performance.contract_number)
    a_giant.string.sub!("[MPS VALUE]", @performance.value)
    a_giant.string.sub!("[CONTRACT TYPE]", @performance.contract_type)
    a_giant.string.sub!("[PERIOD START DATE]", @performance.period_start)
    a_giant.string.sub!("[PERIOD END DATE]", @performance.period_end)

    a_giant.string.sub!("[C1 FULLNAME]", @performance.contact_with_role("Supervisor").full_name)
    a_giant.string.sub!("[C1 PHONE]", @performance.contact_with_role("Supervisor").phone)
    a_giant.string.sub!("[C1 EMAIL]", @performance.contact_with_role("Supervisor").email)
    a_giant.string.sub!("[C1 FAX]", @performance.contact_with_role("Supervisor").fax)
    a_giant.string.sub!("[C2 FULLNAME]", @performance.contact_with_role("Contracting Officer Technical Representative").full_name)
    a_giant.string.sub!("[C2 PHONE]", @performance.contact_with_role("Contracting Officer Technical Representative").phone)
    a_giant.string.sub!("[C2 EMAIL]", @performance.contact_with_role("Contracting Officer Technical Representative").email)
    a_giant.string.sub!("[C2 FAX]", @performance.contact_with_role("Contracting Officer Technical Representative").fax)

    a_giant.string.sub!("[COMPANY NAME]", @performance.partner.name)
    a_giant.string.sub!("[P1 FULLNAME]", @performance.contact_with_role("Company Representative").full_name)
    a_giant.string.sub!("[P1 PHONE]", @performance.contact_with_role("Company Representative").phone)
    a_giant.string.sub!("[P1 EMAIL]", @performance.contact_with_role("Company Representative").email)
    a_giant.string.sub!("[P1 FAX]", @performance.contact_with_role("Company Representative").fax)
    a_giant.string.sub!("[P2 FULLNAME]", @performance.contact_with_role("Other").full_name)
    a_giant.string.sub!("[P2 PHONE]", @performance.contact_with_role("Other").phone)
    a_giant.string.sub!("[P2 EMAIL]", @performance.contact_with_role("Other").email)
    a_giant.string.sub!("[P2 FAX]", @performance.contact_with_role("Other").fax)

    a_giant.string.sub!("[DESCRIPTION]", @performance.description)
    a_giant_string
  end

  private

  def path_to_word_document
    Rails.root.join("lib", "assets", "word_document", "unzipped", "word", "document.xml")
  end
end
