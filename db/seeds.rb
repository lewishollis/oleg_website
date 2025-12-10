# Clear existing data in development
if Rails.env.development?
  puts "Clearing existing data..."
  ContactInquiry.destroy_all
  Artwork.destroy_all
  Project.destroy_all
  Artist.destroy_all
  AdminUser.destroy_all
end

# Create admin user
puts "Creating admin user..."
admin = AdminUser.create!(
  email: "admin@example.com",
  password: "password123",
  password_confirmation: "password123"
)
puts "Admin user created: #{admin.email}"
puts "Password: password123"

# Create artist profile
puts "\nCreating artist profile..."
artist = Artist.create!(
  name: "Oleg Vance",
  bio: "My work is an exploration of the interplay between memory and perception, a visual diary of moments that are both deeply personal and universally resonant. I seek to capture the fleeting, ephemeral qualities of light and shadow, translating them onto canvas not as a direct representation, but as an emotional echo. The process is a meditative one, building layers of oil and cold wax to create a history within the piece, a textured landscape that invites the viewer to look closer and find their own narrative within the abstract forms.

Born and raised in the quiet countryside, I developed a profound connection with the natural world, its cycles of growth and decay, its subtle shifts in color and mood. This early influence continues to shape my artistic philosophy. I believe that art is not about creating something from nothing, but about revealing the extraordinary that already exists within the ordinary. It's about paying attention, about seeing the world with a heightened sense of awareness and translating that vision into a tangible form.

Each painting is a conversation between intention and accident. While I begin with a concept, I remain open to the unexpected discoveries that arise as I work. It is in this dance between control and surrender that the most authentic expressions emerge. My hope is that my work offers a space for contemplation, a quiet moment for viewers to connect with their own inner landscapes and find a sense of peace and recognition in the shared human experience."
)
puts "Artist created: #{artist.name}"

# Create projects
puts "\nCreating projects..."
project1 = Project.create!(
  title: "Urban Landscapes",
  description: "A series exploring the geometric patterns and hidden beauty of modern cityscapes. These works capture the interplay of light, shadow, and architectural form in urban environments.",
  position: 1,
  published: true
)

project2 = Project.create!(
  title: "Digital Dreams",
  description: "An experimental collection merging traditional painting techniques with digital manipulation. Each piece investigates the boundary between the physical and virtual worlds.",
  position: 2,
  published: true
)

project3 = Project.create!(
  title: "Memory Fragments",
  description: "A deeply personal series examining the nature of memory and nostalgia through abstract compositions and found materials.",
  position: 3,
  published: false
)

puts "Created #{Project.count} projects"

# Create artworks
puts "\nCreating artworks..."

# Artworks for Urban Landscapes
5.times do |i|
  Artwork.create!(
    title: "Urban Study #{i + 1}",
    description: "Mixed media on canvas exploring architectural forms and urban geometry.",
    medium: "Mixed media on canvas",
    dimensions: "#{rand(60..120)}x#{rand(80..150)} cm",
    year: 2024,
    position: i + 1,
    project: project1
  )
end

# Artworks for Digital Dreams
4.times do |i|
  Artwork.create!(
    title: "Digital Dreams #{i + 1}",
    description: "A hybrid work combining traditional painting with digital enhancement.",
    medium: "Acrylic and digital",
    dimensions: "#{rand(50..100)}x#{rand(70..120)} cm",
    year: 2023,
    position: i + 1,
    project: project2
  )
end

# Artworks for Memory Fragments
3.times do |i|
  Artwork.create!(
    title: "Fragment #{i + 1}",
    description: "An abstract exploration of personal memory using found objects and paint.",
    medium: "Found objects, oil on panel",
    dimensions: "#{rand(40..80)}x#{rand(60..100)} cm",
    year: 2022,
    position: i + 1,
    project: project3
  )
end

puts "Created #{Artwork.count} artworks"

# Create contact inquiries
puts "\nCreating sample contact inquiries..."
ContactInquiry.create!(
  name: "Sarah Johnson",
  email: "sarah@example.com",
  message: "Hi! I'm interested in purchasing one of your Urban Landscapes pieces. Could you provide information about availability and pricing?",
  read: false
)

ContactInquiry.create!(
  name: "Michael Chen",
  email: "michael.chen@gallery.com",
  message: "We're curating an exhibition on contemporary urban art and would love to discuss featuring your work. Are you available for a call next week?",
  read: true
)

ContactInquiry.create!(
  name: "Emma Davis",
  email: "emma.davis@museum.org",
  message: "Our museum is doing a feature on emerging digital artists. We'd like to interview you for our publication. Please let us know if you're interested.",
  read: false
)

puts "Created #{ContactInquiry.count} contact inquiries"

puts "\n" + "=" * 50
puts "Seed data created successfully!"
puts "=" * 50
puts "\nAdmin Login:"
puts "Email: admin@example.com"
puts "Password: password123"
puts "\nYou can now:"
puts "1. Start the server: bin/rails server"
puts "2. Visit the site: http://localhost:3000"
puts "3. Access admin: http://localhost:3000/admin_users/sign_in"
puts "=" * 50
