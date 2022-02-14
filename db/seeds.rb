# frozen_string_literal: true

# Icons from https://fonts.google.com/icons
[
  {
    title: 'Fast food',
    description: 'Quick service restaurants such as McDonald\'s',
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/fastfood/v12/24px.svg'
  },
  {
    title: 'Groceries',
    description: 'The food or goods in a supermarket',
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/shopping_cart/v17/24px.svg'
  },
  {
    title: 'Transport',
    # TODO: Add description
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/commute/v12/24px.svg'
  },
  {
    title: 'Entertainment',
    # TODO: Add description
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/live_tv/v11/24px.svg'
  },
  {
    title: 'Car',
    description: 'Gas, repair service',
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/directions_car/v17/24px.svg'
  },
  {
    title: 'Clothes',
    # TODO: Add description
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/health_and_safety/v7/24px.svg'
  },
  {
    title: 'Gifts',
    # TODO: Add description
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/card_giftcard/v14/24px.svg'
  },
  {
    title: 'Pets',
    # TODO: Add description
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/pets/v12/24px.svg'
  },
  {
    title: 'Health',
    # TODO: Add description
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/health_and_safety/v7/24px.svg'
  },
  {
    title: 'Toiletry',
    # TODO: Add description
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/bathtub/v11/24px.svg'
  },
  {
    title: 'Taxi',
    # TODO: Add description
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/local_taxi/v12/24px.svg'
  },
  {
    title: 'Sports',
    description: 'Sports equipment, clothes, nutrition; gym membership',
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/sports_soccer/v11/24px.svg'
  }
].each { |attrs| Category.create!(attrs) }
