FactoryBot.define do
    factory :user do
      name { "kouch" }
      email {"at.sao@gmail.com"}
      password {"aaaaaa"}
      password_confirmation {"aaaaaa"}
    end
    factory :reservation do
      id {1}
      name { "kouch" }
      address{"埼玉県"}
      telnum {"0900000000"}
      time {Date.today}
      backtime {"13:30-14:00"}
      order {"ご飯"}
      price {"100"}
      category {"KOUCH"}
      categoryname {"企業"}
      remarks {"特になし"}
      delivery {"青柳樹"}
      trait :invalid do
        name {nil}
      end
    end
    factory :takashi, class: Reservation do
      id {2}
      name { "Takashi" }
      address{"東京都"}
      telnum {"0700000000"}
      time {Date.today}
      backtime {"12:30-13:00"}
      order {"弁当"}
      price {"10000"}
      category {"大戸屋"}
      categoryname {"民間"}
      remarks {"特になし"}
      delivery {"アオヤギ"}
    end
    factory :satoshi, class: Reservation do
      id {3}
      name { "Satoshi" }
      address{"東京都"}
      telnum {"0800000000"}
      time {Date.today}
      backtime {"19:30-20:00"}
      order {"弁当"}
      price {"1000"}
      category {"コラボ"}
      categoryname {"民間"}
      remarks {"特になし"}
      delivery {"アオヤギタツル"}
    end
    factory :info do
      id {1}
      name { "kouch" }
      address{"埼玉県"}
      telnum {"0900000000"}
      remark {"特になし"}
      trait :invalid do
        name {nil}
      end
    end
    factory :ootoya, class: Info do
      id {2}
      name { "Ootoya" }
      address{"東京都"}
      telnum {"0700000000"}
      remark {"特になし"}
    end   
    factory :kouch, class: Info do
      id {3}
      name { "Kouch" }
      address{"東京都"}
      telnum {"0800000000"}
      remark {"特になし"}
    end
  end