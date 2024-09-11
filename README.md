# profile_info_taker

Simply app to take info from the GitHub profile.

Built with: Rails 7.1.4, Ruby 3.2.2, Watir, Bootstrap.

My native language is Ukrainian and this is the default language on the app. All interface text was made with I18n, also available English locale. Language is automatically set based on your browser preferences.

In the form on the start page, you must input GitHub login and press the search button. After that, you will see a page with the results of the search. You will see a username, list, and count of his public repositories if this profile exists. You can also click on the "New search" button, which redirects you to the start page.

Search history doesn't save. In this simple app, the database is not created.
