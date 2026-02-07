- uv init
- uv add dbt-code
- uv pip freeze > requirements.txt
- dbt
- dbt init
  Provide databricks connection detail and token
- dbt debug
- dbt core - select interpreter - _.sql-> jinja-sql, _.yml -> jinja-sql
- uv run dbt debug
- uv run dbt run
