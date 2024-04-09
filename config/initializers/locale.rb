# frozen_string_literal: true

# Permitted locales available for the application
I18n.available_locales = %i[en ru]

# Set default locale to something other than :en
I18n.default_locale = :ru
I18n::Backend::Simple.include(I18n::Backend::Pluralization)
I18n.backend.store_translations :ru, i18n: { plural: { rule: lambda do |n|
                                                               case n
                                                               when 0
                                                                 :zero
                                                               when 1
                                                                 :one
                                                               when 2
                                                                 :two
                                                               when 3
                                                                 :three
                                                               when 4
                                                                 :four
                                                               else
                                                                 :other
                                                               end
                                                             end } }
