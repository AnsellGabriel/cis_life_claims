# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/causes.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     cause = Cause.find_or_initialize_by(cause_title: spreadsheet.cell(row, 'B'))
#     cause.description = spreadsheet.cell(row,'C')
#     puts "#{cause.cause_title}" if cause.save!
# end

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/benefits.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     benefit = Benefit.find_or_initialize_by(name: spreadsheet.cell(row, 'A'))
#     benefit.acronym = spreadsheet.cell(row,'B')
#     puts "#{benefit.name}" if benefit.save!
# end

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/requirements.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     req = Requirement.find_or_initialize_by(name: spreadsheet.cell(row, 'A'))
#     req.description = spreadsheet.cell(row,'B')
#     puts "#{req.name}" if req.save!
# end

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/agents.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     agent = Agent.find_or_initialize_by(name: spreadsheet.cell(row, 'A'))
#     agent.position = spreadsheet.cell(row,'B')
#     # agent.region = spreadsheet.cell(row,'D')
#     puts "#{agent.name}" if agent.save!
# end

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/cooperative.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     coop = Cooperative.find_or_initialize_by(name: spreadsheet.cell(row, 'A'))
#     coop.address = spreadsheet.cell(row,'B')
#     puts "#{coop.name}" if coop.save!
# end

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/causes.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     cause = Cause.find_or_initialize_by(name: spreadsheet.cell(row, 'B'))
#     cause.description = spreadsheet.cell(row,'C')
#     puts "#{cause.name}" if cause.save!
# end

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/plans.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     plan = Plan.find_or_initialize_by(name: spreadsheet.cell(row, 'A'))
#     plan.acronym = spreadsheet.cell(row,'B')
#     plan.description = ''
#     puts "#{plan.name}" if plan.save!
# end

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/status.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     status = Status.find_or_initialize_by(name: spreadsheet.cell(row, 'B'))
#     status.description = spreadsheet.cell(row,'C')
#     puts "#{status.name}" if status.save!
# end
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/documents.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     doc = Document.find_or_initialize_by(name: spreadsheet.cell(row, 'B'))
#     doc.description = ""
#     puts "#{doc.name}" if doc.save!
# end

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/coopbranches.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     coop = Cooperative.find_or_initialize_by(name: spreadsheet.cell(row, 'A'))
#     puts "#{coop.name}" if coop.save!
#     cb = CoopBranch.find_or_initialize_by(name: spreadsheet.cell(row, 'B'))
#     # coop = Cooperative.find_by(coop_name: spreadsheet.cell(row, 'A').strip)
#     cb.cooperative_id = coop.id
#     cb.address = spreadsheet.cell(row,'C')
#     puts "#{cb.name}" if cb.save!
# end

########        AUTHORITY LEVEL
spreadsheet = Roo::Spreadsheet.open("./db/uploads/authority.xlsx")

(2..spreadsheet.last_row).each do |row|
    al = AuthorityLevel.find_or_initialize_by(name: spreadsheet.cell(row, 'A'))
    al.min_authority = spreadsheet.cell(row,'B')
    al.max_authority = spreadsheet.cell(row,'C')
    puts "#{al.name}" if al.save!
end
########        BRANCH
spreadsheet = Roo::Spreadsheet.open("./db/uploads/authority.xlsx")

(2..spreadsheet.last_row).each do |row|
    b = Branch.find_or_initialize_by(name: spreadsheet.cell(row, 'E'))
    puts "#{b.name}" if b.save!
end

spreadsheet = Roo::Spreadsheet.open("./db/uploads/status.xlsx")

(2..spreadsheet.last_row).each do |row|
    b = ClaimRoute.find_or_initialize_by(name: spreadsheet.cell(row, 'E'))
    puts "#{b.name}" if b.save!
end
# GEOGRAPHICAL ADDRESS

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/addresses.xlsx")

# (2..spreadsheet.last_row).each do |row|
#     reg = GeoRegion.find_or_initialize_by(name: spreadsheet.cell(row, 'A').strip)
#     puts "#{reg.name}" if reg.save!

#     pro = GeoProvince.find_or_initialize_by(name: spreadsheet.cell(row, 'B').strip)
#     pro.geo_region_id = reg.id
#     puts "#{pro.name}" if pro.save!
    
#     mun = GeoMunicipality.find_or_initialize_by(name: spreadsheet.cell(row, 'C').strip)
#     mun.geo_region_id = reg.id
#     mun.geo_province_id = pro.id
#     puts "#{mun.name}" if mun.save!
    
#     bar = GeoBarangay.find_or_initialize_by(name: spreadsheet.cell(row, 'D').strip)
#     bar.geo_region_id = reg.id
#     bar.geo_province_id = pro.id
#     bar.geo_municipality_id = mun.id
#     bar.psgc_code = spreadsheet.cell(row, 'E')
#     puts "#{bar.name}" if bar.save!
# end