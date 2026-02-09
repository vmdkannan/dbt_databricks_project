with deduplication_query as 
(
    select
    *,
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY updateDate DESC) as deduplication_id
    FROM 
        {{ source('source', 'items') }}

)
 
 select 
    id, name, category, updateDate   
FROM
    deduplication_query
WHERE
    deduplication_id = 1