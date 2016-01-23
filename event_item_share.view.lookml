- view: event_item_share
  sql_table_name: qa.event_item_share
  fields:

  - dimension: id
    primary_key: true
    type: string
    sql: ${TABLE}.id

  - dimension: anonymous_id
    type: string
    sql: ${TABLE}.anonymous_id

  - dimension: authors_name
    type: string
    sql: ${TABLE}.authors_name

  - dimension: content_slug
    type: string
    sql: ${TABLE}.content_slug

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

  - dimension: event
    type: string
    sql: ${TABLE}.event

  - dimension: event_text
    type: string
    sql: ${TABLE}.event_text

  - dimension: issue_id
    type: int
    sql: ${TABLE}.issue_id

  - dimension: issue_name
    type: string
    sql: ${TABLE}.issue_name

  - dimension_group: original_timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.original_timestamp

  - dimension: partner_id
    type: int
    sql: ${TABLE}.partner_id

  - dimension: partner_name
    type: string
    sql: ${TABLE}.partner_name

  - dimension_group: received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.received_at

  - dimension_group: sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.sent_at

  - dimension: share_id
    type: int
    sql: ${TABLE}.share_id

  - dimension: share_platform
    type: string
    sql: ${TABLE}.share_platform

  - dimension: share_type
    type: string
    sql: ${TABLE}.share_type

  - dimension_group: timestamp
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.timestamp

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
    - authors_name
    - users.last_name
    - users.first_name
    - users.id

