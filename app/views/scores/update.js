<% if @done %>
$('#tr<%= @score.id %>').effect("highlight", {}, 3000);
<% else %>
$('#tr<%= @score.id %>').effect("highlight", {color: 'red'}, 3000);
<% end %>