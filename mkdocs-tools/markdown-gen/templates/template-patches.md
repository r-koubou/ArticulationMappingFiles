# {{ manufacturer }}

{% for product in products %}
## {{ product[0] }}

{% for file_path in product[1] %}
- [{{ file_path }}](../assets/converted/{{ daw }}/{{ manufacturer }}/{{ product[0] }}/{{ file_path }})
{% endfor %}

{% endfor %}
