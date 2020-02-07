set textwidth=0 wrapmargin=0
set nowrap

" let b:pear_tree_pairs = extend(deepcopy(g:pear_tree_pairs), {
"             \ '<*>': {'closer': '</*>',
"             \         'not_if': ['br', 'hr', 'img', 'input', 'link', 'meta',
"             \                    'area', 'base', 'col', 'command', 'embed',
"             \                    'keygen', 'param', 'source', 'track', 'wbr'],
"             \         'not_like': '/$',
"             \         'until': '[^a-zA-Z0-9-._]'
"             \        },
"             \ '{% for * %}': {'closer': '{% endfor %}'},
"             \ '{% block * %}': {'closer': '{% endblock * %}'},
"             \ '{% if * %}': {'closer': '{% endif %}'},
"             \ }, 'keep')

let b:pear_tree_pairs = {
      \ '{% for*%}': {'closer': '{% endfor %}'},
}
