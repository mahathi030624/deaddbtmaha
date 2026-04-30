{% macro generate_schema_name(custom_schema_name, node) -%}

    {{ log("DEBUG: Target=" ~ target.name ~ " | Custom=" ~ custom_schema_name, info=True) }}

    {%- set default_schema = target.schema -%}
    {%- set env = env_var('DBT_ENV_NAME') -%}

    
    {%- if custom_schema_name is not none -%}

        {{ custom_schema_name | trim }}

    {%- else -%}
    
        {{ default_schema }}

    {%- endif -%}

{%- endmacro %}