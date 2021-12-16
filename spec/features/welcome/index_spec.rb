#if session[:user_id] render logout_path else render login_path
#<% if current_user %>
 # <%= link_to "Log Out", '/logout', method: :delete %>
# else
#     <%= link_to  "Register", '/register' %>
#     <%= link_to "Log In", '/login' %>
#with sessions testing need to login and get session started for the user
# (before each)
# click submit
