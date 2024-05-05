# frozen_string_literal: true

# Permitted locales available for the application
I18n.available_locales = %i[en ru]

# Set default locale to something other than :en
I18n.default_locale = :ru
I18n::Backend::Simple.include(I18n::Backend::Pluralization)
I18n.backend.store_translations :ru, i18n: {
  plural: { rule: lambda do |n|
                    if n.zero?
                      :zero
                    elsif ((n % 10) == 1) && ((n % 100 != 11))
                      # 1, 21, 31, 41, 51, 61...
                      :one
                    elsif [2, 3, 4].include?(n % 10) && [12, 13, 14].exclude?(n % 100)
                      # 2-4, 22-24, 32-34...
                      :few
                    elsif (n % 10).zero? || [5, 6, 7, 8, 9].exclude?(n % 10) || [11, 12, 13, 14].exclude?(n % 100)
                      # 0, 5-20, 25-30, 35-40...
                      :many
                    end
                  end }
}
