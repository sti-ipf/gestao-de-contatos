# data = FasterCSV.read("/tmp/data.csv")

# data.each do |d|
# 	contact = Contact.create(:name => d.first)
# 	Email.create(:address => d[1], :contact_id => contact.id)
# 	Phone.create(:number => d[2], :contact_id => contact.id)
# end

data = FasterCSV.read("tmp/data.csv")

data.each do |d|
  # puts d.inspect
  # 10.times do |i|
  #   puts d[i]
  # end
  # break
  institution = Institution.create(:name => d.first, :site => d[1], :mission => d.last)
  Address.create(:description => d[2], :city => d[3], :state => d[4], :country => d[5], :institution => institution)
  Contact.create(:name => d[6], :institution => institution)
  emails = d[7].split('|')
  emails.each do |e|
    Email.create(:address => e.gsub(' ',''), :institution => institution)
  end

  phones = d[8].split('|')
  phones.each do |p|
    Phone.create(:number => p.gsub(' ',''), :phone_type => 1, :institution => institution)
  end

  if !d[9].blank?
    Phone.create(:number => d[9], :phone_type => 4, :institution => institution)
  end
  
end