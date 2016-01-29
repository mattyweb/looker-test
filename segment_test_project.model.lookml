- connection: global_citizen_test_dw

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# - explore: event_action_take
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${event_action_take.user_id} = ${users.id}
#       relationship: many_to_one
# 
# 
# - explore: event_content_view
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${event_content_view.user_id} = ${users.id}
#       relationship: many_to_one
# 
# 
# - explore: event_item_share
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${event_item_share.user_id} = ${users.id}
#       relationship: many_to_one
# 
# 
# - explore: identifies
#   joins:
#     - join: users
#       type: left_outer 
#       sql_on: ${identifies.user_id} = ${users.id}
#       relationship: many_to_one


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
  view_label: events
  label: Events
  joins:
    - join: event_facts
      view_label: events
      relationship: many_to_one
      sql_on: |
        tracks.id = event_facts.event_id and 
        tracks.sent_at = event_facts.sent_at and
        tracks.anonymous_id = event_facts.anonymous_id
      
    - join: sessions_pg_trk
      view_label: sessions
      foreign_key: event_facts.session_id
      relationship: one_to_many

    - join: session_pg_trk_facts
      view_label: sessions
      foreign_key: sessions_pg_trk.session_id
      relationship: one_to_one
    
    - join: tracks_flow
      view_label: events_flow
      relationship: one_to_one
      sql_on: |
        tracks.id = tracks_flow.event_id 
        --and tracks.sent_at = tracks_flow.sent_at
        --and tracks.anonymous_id = tracks_flow.anonymous_id



- explore: users

- explore: sessions_pg_trk
  view_label: sessions
  label: Sessions
  joins: 
    - join: session_pg_trk_facts
      view_label: sessions
      foreign_key: session_id
      relationship: one_to_one
    
#     - join: user_session_facts
#       view_label: users
#       foreign_key: looker_visitor_id

