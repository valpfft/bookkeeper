module Calendar
  def months(params)
    month = params[:month].present? ? params[:month].to_i : Time.now.month
    {
      last: {
        name: Date::MONTHNAMES[month -1],
        number: month - 1,
      },
      current: {
        name: Date::MONTHNAMES[month],
        number: month,
      },
      next: {
        name: Date::MONTHNAMES[month + 1],
        number: month + 1,
      },
    }
  end
end
