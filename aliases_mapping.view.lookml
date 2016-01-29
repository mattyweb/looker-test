- view: aliases_mapping
  derived_table:
    sql_trigger_value: select date(convert_timezone('pst', getdate() - interval '3 hours'))
    sortkeys: [alias]
    distkey: alias
    sql: |
       with
            
            -- Establish all child-to-parent edges from tables (tracks, pages, aliases) 
            all_realiases as (
              select anonymous_id as alias
                , user_id as next_alias
                , sent_at as realiased_at
              from qa.tracks
            
              union
            
              select user_id
                , null
                , sent_at
              from qa.tracks
            
               --union
            
               --select previous_id
                --, user_id
                --, sent_at     
               --from qa.aliases
              
               --union
              
               --select user_id
                 --, null
                 --, sent_at
               --from qa.aliases
               
               union
               
               select anonymous_id
                  , user_id
                  , sent_at
               from qa.pages
               
               union
               
               select user_id
                  , null
                  , sent_at
               from qa.pages
            ),
            
            -- Only keep the oldest non-null parent for each child
            realiases as (
              select distinct alias
                , first_value(next_alias ignore nulls) over(partition by alias order by realiased_at rows between unbounded preceding and unbounded following) as next_alias
              from all_realiases
            )
            
            -- Traverse the tree upwards and point every node at its root
            select distinct r0.alias
              , coalesce(r9.next_alias
                  , r9.alias
                  , r8.alias
                  , r7.alias
                  , r6.alias
                  , r5.alias
                  , r4.alias
                  , r3.alias
                  , r2.alias
                  , r1.alias
                  , r0.alias
                ) as looker_visitor_id
            from realiases r0
              left join realiases r1 on r0.next_alias = r1.alias
              left join realiases r2 on r1.next_alias = r2.alias
              left join realiases r3 on r2.next_alias = r3.alias
              left join realiases r4 on r3.next_alias = r4.alias
              left join realiases r5 on r4.next_alias = r5.alias
              left join realiases r6 on r5.next_alias = r6.alias
              left join realiases r7 on r6.next_alias = r7.alias
              left join realiases r8 on r7.next_alias = r8.alias
              left join realiases r9 on r8.next_alias = r9.alias

  fields:

  - dimension: alias
    primary_key: true
    sql: ${TABLE}.alias

  - dimension: looker_visitor_id
    sql: ${TABLE}.looker_visitor_id


