module ApplicationHelper
    def to_curr(value)
        number_to_currency(value, unit: "")
    end
end
