{% macro dynamic_partition(column_name, interval)%}
    CASE
        WHEN ({{column_name}}) >= DATE_SUB(CURRENT_DATE(), INTERVAL 3 {{interval}}) THEN 'recent'
        ELSE 'historical'
    END AS partition_group
{% endmacro %}