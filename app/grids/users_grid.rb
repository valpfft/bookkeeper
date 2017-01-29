class UsersGrid
  include Datagrid

  scope do
    User
  end

  filter(:email, :string)
  filter(:name, :string)
  filter(:id, :integer)

  column(:id)
  column(:email)
  column(:name)
  column(:updated_at, header: "Updated") do |user|
    user.updated_at.to_date
  end
  column(:locked) do
    access_locked? ? "Yes" : "No"
  end
  column(:actions, header: "", html: true) do |user|
    link_to(icon("trash"), user_path(user), data: { confirm: "Are you sure?" },
                                            method: :delete, class: "button")
  end
end
