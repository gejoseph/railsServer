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

                        
# Organizations ================================================================
kpdc       = Organization.create(name: "KPDC", orgType:"Student Club")
signu      = Organization.create(name: "Sigma Nu", orgType: "Fraternity")
art_club   = Organization.create(name: "BHS Art Club", orgType: "Student Club")
akdp       = Organization.create(name: "Alpha Kappa Delta Phi", orgType: "Sorority")
kapsig     = Organization.create(name: "Kappa Sigma", orgType: "Fraternity")
cmu        = Organization.create(name: "Carnegie Mellon University", orgType: "School")


# OrganizationUsers ============================================================
kpdc_profh     = OrganizationUser.create(organization: kpdc, user: profh, isAdmin: false)
signu_john     = OrganizationUser.create(organization: signu, user: john, isAdmin: true)
signu_kenny    = OrganizationUser.create(organization: signu, user: kenny, isAdmin: false)
art_club_grace = OrganizationUser.create(organization: art_club, user: grace, isAdmin: false)
art_club_sara  = OrganizationUser.create(organization: art_club, user: sara, isAdmin: false)
akdp_sara      = OrganizationUser.create(organization: akdp, user: sara, isAdmin: false)
kapsig_max     = OrganizationUser.create(organization: kapsig, user: max, isAdmin: false)
cmu_shane      = OrganizationUser.create(organization: cmu, user: shane, isAdmin: false)


# OrganizationEvents ===========================================================
kpdc_dance             = OrganizationEvent.create(organization: kpdc, event: dance_party)
artclub_artnight       = OrganizationEvent.create(organization: art_club, event: art_night)
akdp_charity           = OrganizationEvent.create(organization: akdp, event: charity_event)
signu_signu_party      = OrganizationEvent.create(organization: signu, event: signu_party)
kapsig_kapsig_party    = OrganizationEvent.create(organization: kapsig, event: kapsig_party)
cmu_coffee             = OrganizationEvent.create(organization: cmu, event: coffee_chat)


# Friends ======================================================================
kenny_grace    = Friend.create(user1: kenny, user2: grace, accepted: false)
kenny_sara     = Friend.create(user1: kenny, user2: sara, accepted: false)
grace_sara     = Friend.create(user1: grace, user2: sara, accepted: true)
shane_kenny    = Friend.create(user1: shane, user2: kenny, accepted: true)
shane_profh    = Friend.create(user1: shane, user2: profh, accepted: false)
profh_max      = Friend.create(user1: profh, user2: max, accepted: true)
john_sara      = Friend.create(user1: john, user2: sara, accepted: false)


# Hosts ========================================================================
profh_dance_party  = Host.create(user: profh, event: dance_party)
sara_art_night     = Host.create(user: sara, event: art_night)
sara_charity_event = Host.create(user: sara, event: charity_event)
john_signu_party   = Host.create(user: john, event: signu_party)
max_kapsig_party   = Host.create(user: max, event: kapsig_party)
shane_coffee_chat  = Host.create(user: shane, event: coffee_chat)


# Invites ======================================================================
# Dance Party Invites ======
kenny_dance_party      = Invite.create( user: kenny,
                                        event: dance_party,
                                        checkinTime: DateTime.new(2022, 4, 15, 10, 5, 0),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 1231231234,
                                        coverChargePaid: 2.00)
grace_dance_party      = Invite.create( user: grace,
                                        event: dance_party,
                                        checkinTime: DateTime.new(2022, 4, 15, 10, 12, 0),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 1231231234,
                                        coverChargePaid: 10.00)

# Art Night Invites ======
shane_art_night        = Invite.create( user: shane,
                                        event: art_night,
                                        checkinTime: DateTime.new(2022, 9, 24, 13, 5, 0),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 3213214321,
                                        coverChargePaid: 0)
john_art_night         = Invite.create( user: john,
                                        event: art_night,
                                        checkinTime: nil,
                                        inviteStatus: false,
                                        checkinStatus: false,
                                        phoneNumber: 3213214321,
                                        coverChargePaid: 0)
max_art_night          = Invite.create( user: max,
                                        event: art_night,
                                        checkinTime: DateTime.new(2022, 9, 24, 14, 0, 0),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 3213214321,
                                        coverChargePaid: 0)

# Charity Event Invites ======
grace_charity_event    = Invite.create( user: grace,
                                        event: charity_event,
                                        checkinTime: DateTime.new(2022, 5, 1, 20, 0, 0),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 4123456788,
                                        coverChargePaid: 0)
profh_charity_event    = Invite.create( user: profh,
                                        event: charity_event,
                                        checkinTime: DateTime.new(2022, 5, 1, 21, 0, 12),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 4123456788,
                                        coverChargePaid: 0)
kenny_charity_event    = Invite.create( user: kenny,
                                        event: charity_event,
                                        checkinTime: nil,
                                        inviteStatus: true,
                                        checkinStatus: false,
                                        phoneNumber: 4123456788,
                                        coverChargePaid: 0)

# Signu Party Invites ======
sara_signu_party       = Invite.create( user: sara,
                                        event: signu_party,
                                        checkinTime: nil,
                                        inviteStatus: false,
                                        checkinStatus: false,
                                        phoneNumber: 5083211234,
                                        coverChargePaid: 0)
max_signu_party        = Invite.create( user: max,
                                        event: signu_party,
                                        checkinTime: DateTime.new(2022, 1, 20, 22, 0, 0),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 5083211234,
                                        coverChargePaid: 20)
shane_signu_party      = Invite.create( user: shane,
                                        event: signu_party,
                                        checkinTime: DateTime.new(2022, 1, 20, 23, 36, 1),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 5083211234,
                                        coverChargePaid: 30)
grace_signu_party      = Invite.create( user: grace,
                                        event: signu_party,
                                        checkinTime: DateTime.new(2022, 1, 20, 1, 23, 45),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 5083211234,
                                        coverChargePaid: 30)

# Kapsig Party Invites ======
john_kapsig_party      = Invite.create( user: john,
                                        event: kapsig_party,
                                        checkinTime: nil,
                                        inviteStatus: false,
                                        checkinStatus: false,
                                        phoneNumber: 6174125032,
                                        coverChargePaid: 0)
kenny_kapsig_party     = Invite.create( user: kenny,
                                        event: kapsig_party,
                                        checkinTime: nil,
                                        inviteStatus: true,
                                        checkinStatus: false,
                                        phoneNumber: 6174125032,
                                        coverChargePaid: 0)
profh_kapsig_party     = Invite.create( user: profh,
                                        event: kapsig_party,
                                        checkinTime: nil,
                                        inviteStatus: false,
                                        checkinStatus: false,
                                        phoneNumber: 6174125032,
                                        coverChargePaid: 0)

# Coffee Chat Invites ======
profh_coffee_chat      = Invite.create( user: profh,
                                        event: coffee_chat,
                                        checkinTime: DateTime.new(2022, 4, 7, 8, 0, 0),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 4120670443,
                                        coverChargePaid: 0)
sara_coffee_chat       = Invite.create( user: sara,
                                        event: coffee_chat,
                                        checkinTime: DateTime.new(2022, 4, 7, 8, 12, 0),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 4120670443,
                                        coverChargePaid: 0)
kenny_coffee_chat      = Invite.create( user: kenny,
                                        event: coffee_chat,
                                        checkinTime: DateTime.new(2022, 4, 7, 8, 31, 0),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 4120670443,
                                        coverChargePaid: 0)
grace_coffee_chat      = Invite.create( user: grace,
                                        event: coffee_chat,
                                        checkinTime: DateTime.new(2022, 4, 7, 8, 1, 43),
                                        inviteStatus: true,
                                        checkinStatus: true,
                                        phoneNumber: 4120670443,
                                        coverChargePaid: 0)