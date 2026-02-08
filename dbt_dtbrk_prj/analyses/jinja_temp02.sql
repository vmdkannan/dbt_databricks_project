{%- set names = ['Phil', 'David', 'Simon'] -%}

{% for item in names %}
  {{ item }}
{% endfor %}


{% set country = ['France', 'UK', 'India'] %}

{% for item in country %}
  {% if item != 'India' %}
    Europe : {{ item }}
  {% else %}
    Asia : {{ item }}
  {% endif %} 
{% endfor %}