module Contexts
    module Users

        def create_users
            @john   = FactoryBot.create(:user)
            @kenny  = FactoryBot.create(:user,
                                        username: "khu",
                                        email: "kenny@andrew.cmu.edu",
                                        firstName: "Kenny",
                                        lastName: "Hu",
                                        phoneNumber: 1231231234,
                                        birthday: DateTime.new(1999, 6, 7))
            @grace  = FactoryBot.create(:user,
                                        username: "gjoseph",
                                        email: "grace@andrew.cmu.edu",
                                        firstName: "Grace",
                                        lastName: "Joseph",
                                        phoneNumber: 4121231234,
                                        birthday: DateTime.new(2000, 4, 9))
            @sara   = FactoryBot.create(:user,
                                        username: "ssong",
                                        email: "sara@andrew.cmu.edu",
                                        firstName: "Sara",
                                        lastName: "Song",
                                        phoneNumber: 6171231234,
                                        birthday: DateTime.new(2001, 6, 24))
            @shane  = FactoryBot.create(:user,
                                        username: "saung",
                                        email: "shane@andrew.cmu.edu",
                                        firstName: "Shane",
                                        lastName: "Aung",
                                        phoneNumber: 4123214321,
                                        birthday: DateTime.new(1999, 11, 18))
            @profh  = FactoryBot.create(:user,
                                        username: "profh",
                                        email: "profh@cmu.edu",
                                        firstName: "Prof",
                                        lastName: "H",
                                        phoneNumber: 4120980987,
                                        birthday: DateTime.new(1980, 10, 31))
            @max    = FactoryBot.create(:user,
                                        username: "msergent",
                                        email: "max@yahoo.com",
                                        firstName: "Max",
                                        lastName: "Sergent",
                                        phoneNumber: 5111232345,
                                        birthday: DateTime.new(1986, 12, 2))
        end

        def destroy_users
            @john.destroy
            @kenny.destroy
            @grace.destroy
            @sara.destroy
            @shane.destroy
            @profh.destroy
            @max.destroy
        end

    end
end