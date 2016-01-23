- connection: global_citizen_test_dw

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

- explore: event_action_take
  joins:
    - join: users
      type: left_outer 
      sql_on: ${event_action_take.user_id} = ${users.id}
      relationship: many_to_one


- explore: event_content_view
  joins:
    - join: users
      type: left_outer 
      sql_on: ${event_content_view.user_id} = ${users.id}
      relationship: many_to_one


- explore: event_item_share
  joins:
    - join: users
      type: left_outer 
      sql_on: ${event_item_share.user_id} = ${users.id}
      relationship: many_to_one


- explore: identifies
  joins:
    - join: users
      type: left_outer 
      sql_on: ${identifies.user_id} = ${users.id}
      relationship: many_to_one


- explore: pages
  joins:
    - join: users
      type: left_outer 
      sql_on: ${pages.user_id} = ${users.id}
      relationship: many_to_one


- explore: shadow_user_signup
  joins:
    - join: users
      type: left_outer 
      sql_on: ${shadow_user_signup.user_id} = ${users.id}
      relationship: many_to_one



- explore: tracks
  joins:
    - join: users
      type: left_outer 
      sql_on: ${tracks.user_id} = ${users.id}
      relationship: many_to_one



- explore: users

