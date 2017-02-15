class SpendingsGrid
  include Datagrid

  scope do
    Spending
  end

  filter(:amount, :float, range: true)
  filter(:name)
  filter(:category)

  column(:amount) do |spending|
    ActionController::Base.helpers.number_to_currency(spending.amount)
  end
  column(:name, html: true) do |spending|
    link_to spending.name, spending_path(spending)
  end
  column(:category, html: true) do |spending|
    link_to spending.category.name, spending.category
  end
  column(:created_at, header: "Date") do |spending|
    spending.created_at.to_date
  end

  column(:actions, header: "", html: true) do |spending|
    link_to(icon("trash"), spending_path(spending),
            data: { confirm: "Are you sure?" },
            method: :delete, class: "btn") +
      link_to(icon("pencil"), edit_spending_path(spending))
  end
end
