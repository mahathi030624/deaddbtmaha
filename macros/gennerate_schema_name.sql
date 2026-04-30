{% macro generate_schema_name(custom_schema_name, node) -%}

    {{ "FORCED_SCHEMA" }}

    -- {%- set default_schema = target.schema -%}
    -- {%- set env = env_var('DBT_ENV_NAME') -%}

    -- {{ log("DEBUG: target.name is [" ~ target.name ~ "] and custom_schema_name is [" ~ custom_schema_name ~ "]", info=True) }}

    -- {%- if custom_schema_name is not none or target.name != 'prod' -%}

    --     {{ default_schema }}

    -- {%- else -%}
    
    --     {{ custom_schema_name | trim }}

    -- {%- endif -%}

{%- endmacro %}