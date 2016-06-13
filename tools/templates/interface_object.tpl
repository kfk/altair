# This file auto-generated by `generate_schema_interface.py`.
# Do not modify this file directly.

import traitlets as T
{{ cls.base_import }}
{%- if cls.imports %}
{{ cls.imports|join('\n') }}
{%- endif %}


class {{ cls.name }}({{ cls.basename }}):
    """Wrapper for Vega-Lite {{ cls.name }} definition.
    {{ cls.long_description }}
    Attributes
    ----------
    {% for attr in cls.attributes -%}
    {{ attr.name }}: {{ attr.trait_descr}}
        {{ attr.short_description }}
    {% endfor -%}
    """
    {% for attr in cls.attributes -%}
    {{ attr.name }} = {{ attr.trait_fulldef }}
    {% endfor %}

    {%- set comma = joiner(", ") %}
    def __init__(self, {% for attr in cls.attributes %}{{ attr.name }}=None, {% endfor %}**kwargs):
        kwds = dict({% for attr in cls.attributes %}{{ comma() }}{{ attr.name }}={{ attr.name }}{% endfor %})
        kwargs.update({k:v for k, v in kwds.items() if v is not None})
        super({{ cls.name }}, self).__init__(**kwargs)