# frozen_string_literal: true

# TODO: Add icon URLs and description to all categories.
# https://fonts.google.com/icons
Category.insert_all!([
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
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/commute/v12/24px.svg'
  },
  {
    title: 'Entertainment',
  },
  {
    title: 'Car',
    icon_url: 'https://fonts.gstatic.com/s/i/materialiconsoutlined/directions_car/v17/24px.svg'
  },
  {
    title: 'Clothes',
  },
  {
    title: 'Gifts',
  },
  {
    title: 'Communications',
  },
  {
    title: 'Pets',
  },
  {
    title: 'Health',
  },
  {
    title: 'Toiletry',
  },
  {
    title: 'Taxi',
  },
  {
    title: 'Sports',
  },
])
