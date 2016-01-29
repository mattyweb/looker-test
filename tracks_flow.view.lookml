- explore: tracks_flow
- view: tracks_flow
  derived_table:
    sql: |
      select a.event_id
            , a.session_id
            , a.track_sequence_number
            , a.event
            , a.looker_visitor_id
            , a.anonymous_id
            , a.sent_at
            , b.event as event_2
            , c.event as event_3
            , d.event as event_4
            , e.event as event_5
      from ${event_facts.SQL_TABLE_NAME} a
      left join ${event_facts.SQL_TABLE_NAME} b
      on a.track_sequence_number + 1 = b.track_sequence_number
      and a.session_id = b.session_id
      left join ${event_facts.SQL_TABLE_NAME} c
      on a.track_sequence_number + 2 = c.track_sequence_number
      and a.session_id = c.session_id
      left join ${event_facts.SQL_TABLE_NAME} d
      on a.track_sequence_number + 3 = d.track_sequence_number
      and a.session_id = d.session_id
      left join ${event_facts.SQL_TABLE_NAME} e
      on a.track_sequence_number + 4 = e.track_sequence_number
      and a.session_id = e.session_id
      order by a.session_id, a.track_sequence_number
    
    sql_trigger_value: select count(*) from ${sessions_pg_trk.SQL_TABLE_NAME}
    sortkeys: [event_id, looker_visitor_id, session_id]
    distkey: looker_visitor_id

  fields:

  - dimension: event_id
    primary_key: true
    sql: ${TABLE}.event_id
    hidden: true

  - dimension: session_id
    hidden: true
    sql: ${TABLE}.session_id

  - dimension: track_sequence_number
    type: number
    hidden: true
    sql: ${TABLE}.track_sequence_number

  - dimension: event
    hidden: true
    sql: ${TABLE}.event

  - dimension: user_id
    hidden: true
    sql: ${TABLE}.looker_visitor_id

  - dimension: event_2
    label: '2nd Event'
    sql: ${TABLE}.event_2

  
  - measure: event_2_drop_off
    label: '2nd Event Remaining Count'
    type: count
    filter: 
      event_2: -NULL
    drill_fields: detail*      
    
  - dimension: event_3
    label: '3rd Event'
    sql: ${TABLE}.event_3
  
  - measure: event_3_drop_off
    label: '3rd Event Remaining Count'
    type: count
    filter: 
      event_3: -NULL

  - dimension: event_4
    label: '4th Event'
    sql: ${TABLE}.event_4
  
  - measure: event_4_drop_off
    label: '4th Event Remaining Count'
    type: count
    filter: 
      event_4: -NULL

  - dimension: event_5
    label: '5th Event'
    sql: ${TABLE}.event_5
  
  - measure: event_5_drop_off
    label: '5th Event Remaining Count'
    type: count
    filter: 
      event_5: -NULL
  
  sets:
    detail:
      - event_id
      - session_id
      - track_sequence_number
      - event
      - event_2
      - event_3
      - event_4
      - event_5