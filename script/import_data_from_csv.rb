data = FasterCSV.read("/tmp/data.csv")

data.each do |d|
	contact = Contact.create(:name => d.first)
	Email.create(:address => d[1], :contact_id => contact.id)
	Phone.create(:number => d[2], :contact_id => contact.id)
end