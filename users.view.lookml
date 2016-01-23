- view: users
  sql_table_name: qa.users
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: available_points
    type: number
    sql: ${TABLE}.available_points

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: created_at
    type: string
    sql: ${TABLE}.created_at

  - dimension: email
    type: string
    sql: ${TABLE}.email

  - dimension: email_confirmed
    type: yesno
    sql: ${TABLE}.email_confirmed

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: has_acted_to_end_poverty
    type: yesno
    sql: ${TABLE}.has_acted_to_end_poverty

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension: locale
    type: string
    sql: ${TABLE}.locale

  - dimension: postal_code
    type: string
    sql: ${TABLE}.postal_code

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension: total_earned_points
    type: number
    sql: ${TABLE}.total_earned_points

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - last_name
    - first_name
    - event_action_take.count
    - event_content_view.count
    - event_item_share.count
    - identifies.count
    - pages.count
    - read_article.count
    - recommended_action_displayed.count
    - shadow_user_signup.count
    - testing_from_qa.count
    - took_action_on_action_page.count
    - tracks.count
    - user_signup.count

