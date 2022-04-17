# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# EVENTS =======================================================================
dance_party     = Event.create( name: "Dance Party",
                                startTime: DateTime.new(2022, 4, 15, 10, 0, 0),
                                endTime: DateTime.new(2022, 4, 15, 12, 30, 0),
                                street1:  "123 Forbes Ave",
                                street2: nil,
                                city: "Pittsburgh",
                                state: "PA",
                                zip: 15213,
                                description: "This dance party is super awesome, gonna do the Cotton-Eye Joe all night!!!",
                                attendenceVisible: true,
                                friendsAttendingVisible: false,
                                attendenceCap: 20,
                                coverCharge: 10.00,
                                isOpenInvite: false,
                                venueLatitude: 40.44119848422531,
                                venueLongitude:  -80.00313621585269)
art_night       = Event.create( name: "Art Night", 
                                startTime: DateTime.new(2022, 9, 24, 12, 0, 0), 
                                endTime: DateTime.new(2022, 9, 24, 15, 0, 0),
                                street1: "46 Tappan St",
                                street2: "Rm 203",
                                city: "Brookline",
                                state: "MA",
                                zip: "02445",
                                description: "Come make lots of cool stuff with us!!",
                                attendenceVisible: true,
                                friendsAttendingVisible: true,
                                attendenceCap: 30,
                                coverCharge: 0,
                                isOpenInvite: false,
                                venueLatitude: 42.33172248968372, 
                                venueLongitude: -71.1276910319482)
charity_event   = Event.create( name: "Charity Dinner",
                                startTime: DateTime.new(2022, 05, 01, 20, 0, 0), 
                                endTime: DateTime.new(2022, 05, 01, 23, 0, 0),
                                street1: "67 Fifth Ave",
                                street2: "Rm 443",
                                city: "Pittsburgh",
                                state: "PA",
                                zip: 15213,
                                description: "Every dollar donated during this dinner goes towards helping people in need",
                                attendenceVisible: false,
                                friendsAttendingVisible: false,
                                attendenceCap: 20,
                                coverCharge: 0,
                                isOpenInvite: true,
                                venueLatitude: 40.44221987732466, 
                                venueLongitude: -80.00264637352394)
signu_party     = Event.create( name: "Sigma Nu Party",
                                startTime: DateTime.new(2022, 01, 20, 22, 0, 0), 
                                endTime: DateTime.new(2022, 01, 21, 3, 0, 0),
                                street1: "104 Margaret Morrison Street",
                                street2: nil,
                                city: "Pittsburgh",
                                state: "PA",
                                zip: 15213,
                                description: "Lots of drinks, come have a good time!",
                                attendenceVisible: false,
                                friendsAttendingVisible: true,
                                attendenceCap: 25,
                                coverCharge: 30,
                                isOpenInvite: false,
                                venueLatitude: 40.442134416284475,
                                venueLongitude: -79.93884754468831)
kapsig_party    = Event.create( name: "Kappa Sigma Partay",
                                startTime: DateTime.new(2022, 05, 11, 21, 0, 0), 
                                endTime: DateTime.new(2022, 05, 12, 4, 0, 0),
                                street1: "1063 Morewood Avenue",
                                street2: nil,
                                city: "Pittsburgh",
                                state: "PA",
                                zip: 15213,
                                description: "Celebrate the end of the semester with us!!!",
                                attendenceVisible: true,
                                friendsAttendingVisible: true,
                                attendenceCap: 40,
                                coverCharge: 30,
                                isOpenInvite: false,
                                venueLatitude: 40.44561063680285, 
                                venueLongitude: -79.94143980235951)
coffee_chat     = Event.create( name: "Coffee Chat with IS Profs",
                                startTime: DateTime.new(2022, 04, 07, 8, 0, 0), 
                                endTime: DateTime.new(2022, 04, 07, 9, 0, 0),
                                street1: "4800 Forbes Ave",
                                street2: "Rm 1002",
                                city: "Pittsburgh",
                                state: "PA",
                                zip: 15213,
                                description: "Sign up to chat with some IS professors during Carnival!",
                                attendenceVisible: true,
                                friendsAttendingVisible: false,
                                attendenceCap: 10,
                                coverCharge: 0,
                                isOpenInvite: true,
                                venueLatitude: 40.4445165337803, 
                                venueLongitude: -79.94553821758295)

# USERS ========================================================================
john    = User.create(  username: "johnd",
                        email: "johnd@gmail.com",
                        firstName: "John",
                        lastName: "Doe",
                        phoneNumber: 3213214321,
                        birthday: DateTime.new(2000, 07, 10),
                        password: "secret",
                        password_confirmation: "secret")
kenny   = User.create(  username: "khu",
                        email: "kenny@andrew.cmu.edu",
                        firstName: "Kenny",
                        lastName: "Hu",
                        phoneNumber: 1231231234,
                        birthday: DateTime.new(1999, 6, 7),
                        password: "secret",
                        password_confirmation: "secret")
grace   = User.create(  username: "gjoseph",
                        email: "grace@andrew.cmu.edu",
                        firstName: "Grace",
                        lastName: "Joseph",
                        phoneNumber: 4121231234,
                        birthday: DateTime.new(2000, 4, 9),
                        password: "secret",
                        password_confirmation: "secret")
sara    = User.create(  username: "ssong",
                        email: "sara@andrew.cmu.edu",
                        firstName: "Sara",
                        lastName: "Song",
                        phoneNumber: 6171231234,
                        birthday: DateTime.new(2001, 6, 24),
                        password: "secret",
                        password_confirmation: "secret")
shane   = User.create(  username: "saung",
                        email: "shane@andrew.cmu.edu",
                        firstName: "Shane",
                        lastName: "Aung",
                        phoneNumber: 4123214321,
                        birthday: DateTime.new(1999, 11, 18),
                        password: "secret",
                        password_confirmation: "secret")
profh   = User.create(  username: "profh",
                        email: "profh@cmu.edu",
                        firstName: "Prof",
                        lastName: "H",
                        phoneNumber: 4120980987,
                        birthday: DateTime.new(1980, 10, 31),
                        password: "secret",
                        password_confirmation: "secret")
max     = User.create(  username: "msergent",
                        email: "max@yahoo.com",
                        firstName: "Max",
                        lastName: "Sergent",
                        phoneNumber: 5111232345,
                        birthday: DateTime.new(1986, 12, 2),
                        password: "secret",
                        password_confirmation: "secret")

# Organizations ========================================================================



include Contexts::OrganizationUsers
include Contexts::OrganizationEvents
include Contexts::Friends
include Contexts::Hosts
include Contexts::Invites