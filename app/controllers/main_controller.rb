# frozen_string_literal: true

class MainController < ApplicationController
  def index; end

  def search
    if params[:login].present?
      search_start = Time.now.to_f
      browser = Watir::Browser.new headless: true
      browser.goto("https://github.com/#{params[:login]}?tab=repositories")

      if browser.span(class: 'p-name vcard-fullname d-block overflow-hidden').present?
        @username = browser.span(class: 'p-name vcard-fullname d-block overflow-hidden').text
        @repositories = []
        if browser.ul(data_filterable_for: 'your-repos-filter').present?
          loop do
            repositories = browser.divs(class: 'd-inline-block mb-1')

            repositories.each do |rep|
              @repositories << rep.h3.a.text
            end

            break unless browser.a(class: 'next_page').present?

            browser.a(class: 'next_page').click
            sleep 2
          end
        end
      end

      browser.close
      search_end = Time.now.to_f
      @search_time = (search_end - search_start).round(3)
      @search_params = params[:login]
    else
      redirect_to root_path, alert: t('alert.search')
    end
  end
end
