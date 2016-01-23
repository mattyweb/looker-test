- view: event_action_take
  sql_table_name: qa.event_action_take
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: action_id
    type: string
    sql: ${TABLE}.action_id

  - dimension: action_type
    type: string
    sql: ${TABLE}.action_type

  - dimension: anonymous_id
    type: string
    sql: ${TABLE}.anonymous_id

  - dimension: category
    type: string
    sql: ${TABLE}.category

  - dimension: collect_data_share
    type: yesno
    sql: ${TABLE}.collect_data_share

  - dimension: context_ip
    type: string
    sql: ${TABLE}.context_ip

  - dimension: context_library_name
    type: string
    sql: ${TABLE}.context_library_name

  - dimension: context_library_version
    type: string
    sql: ${TABLE}.context_library_version

  - dimension: context_page_path
    type: string
    sql: ${TABLE}.context_page_path

  - dimension: context_page_referrer
    type: string
    sql: ${TABLE}.context_page_referrer

  - dimension: context_page_title
    type: string
    sql: ${TABLE}.context_page_title

  - dimension: context_page_url
    type: string
    sql: ${TABLE}.context_page_url

  - dimension: context_user_agent
    type: string
    sql: ${TABLE}.context_user_agent

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: email_to
    type: string
    sql: ${TABLE}.email_to

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: event_text
    type: string
    sql: ${TABLE}.event_text

  - dimension: has_completed
    type: yesno
    sql: ${TABLE}.has_completed

  - dimension: issue_id
    type: string
    sql: ${TABLE}.issue_id

  - dimension: issue_name
    type: string
    sql: ${TABLE}.issue_name

  - dimension: mobile_only
    type: yesno
    sql: ${TABLE}.mobile_only

  - dimension_group: original_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.original_timestamp

  - dimension: page_type
    type: string
    sql: ${TABLE}.page_type

  - dimension: partner_id
    type: string
    sql: ${TABLE}.partner_id

  - dimension: partner_name
    type: string
    sql: ${TABLE}.partner_name

  - dimension: points
    type: number
    sql: ${TABLE}.points

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension_group: sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sent_at

  - dimension: slug
    type: string
    sql: ${TABLE}.slug

  - dimension_group: timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.timestamp

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension: user_id
    type: string
    # hidden: true
    sql: ${TABLE}.user_id

  - dimension: uuid
    type: int
    sql: ${TABLE}.uuid

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - partner_name
    - issue_name
    - context_library_name
    - users.last_name
    - users.first_name
    - users.id

