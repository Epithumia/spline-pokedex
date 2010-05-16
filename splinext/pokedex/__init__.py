# encoding: utf8
import os.path
from pkg_resources import resource_filename

from docutils import nodes
from docutils.parsers.rst import roles
from pylons import config, tmpl_context as c
from routes import url_for as url
from sqlalchemy.orm.exc import NoResultFound

import pokedex.db
import pokedex.db.tables as tables
import pokedex.lookup
import splinext.pokedex.model
from splinext.pokedex import helpers as pokedex_helpers
import spline.lib.helpers as h
from spline.lib.plugin import PluginBase, PluginLink, Priority


def add_routes_hook(map, *args, **kwargs):
    """Hook to inject some of our behavior into the routes configuration."""
    map.connect('/dex/media/*path', controller='dex', action='media')
    map.connect('/dex/lookup', controller='dex', action='lookup')
    map.connect('/dex/suggest', controller='dex', action='suggest')

    # These are more specific than the general pages below, so must be first
    map.connect('/dex/pokemon/search', controller='dex_search', action='pokemon_search')

    map.connect('/dex/abilities/{name}', controller='dex', action='abilities')
    map.connect('/dex/items/{pocket}', controller='dex', action='item_pockets')
    map.connect('/dex/items/{pocket}/{name}', controller='dex', action='items')
    map.connect('/dex/locations/{name}', controller='dex', action='locations')
    map.connect('/dex/moves/{name}', controller='dex', action='moves')
    map.connect('/dex/natures/{name}', controller='dex', action='natures')
    map.connect('/dex/pokemon/{name}', controller='dex', action='pokemon')
    map.connect('/dex/pokemon/{name}/flavor', controller='dex', action='pokemon_flavor')
    map.connect('/dex/pokemon/{name}/locations', controller='dex', action='pokemon_locations')
    map.connect('/dex/types/{name}', controller='dex', action='types')

    map.connect('/dex/abilities', controller='dex', action='abilities_list')
    map.connect('/dex/items', controller='dex', action='items_list')
    map.connect('/dex/natures', controller='dex', action='natures_list')
    map.connect('/dex/pokemon', controller='dex', action='pokemon_list')
    map.connect('/dex/types', controller='dex', action='types_list')

    map.connect('/dex/gadgets/pokeballs', controller='dex_gadgets', action='capture_rate')


def get_role(table):
    """Need a separate function here to avoid problems with generating closures
    inside a loop below.
    """

    table_name = table.__tablename__

    def role(name, rawtext, text, lineno, inliner, options={}, content=[]):
        # Import here so this module is safe to load
        from splinext.pokedex.db import get_by_name_query, pokemon_query

        try:
            # Find the object and get a link to it
            if name == 'pokemon':
                obj = pokemon_query(text).one()
            else:
                obj = get_by_name_query(table, text).one()
            options['refuri'] = pokedex_helpers.make_thingy_url(obj)
            node = nodes.reference(rawtext, obj.name, **options)
        except NoResultFound:
            # Invalid name.  Just ignore the tag I guess
            node = nodes.inline(rawtext, text, **options)
        return [node], []

    return role

def after_setup_hook(*args, **kwargs):
    """Hook to do some housekeeping after the app starts."""
    ### reST text roles

    for table in (tables.Ability, tables.Item, tables.Move, tables.Pokemon,
                  tables.Type):
        roles.register_local_role(table.__singlename__, get_role(table))

    # For now, simply remove mechanic links
    def mechanic_role(name, rawtext, text, lineno, inliner, options={},
                      content=[]):
        node = nodes.inline(rawtext, text, **options)
        return [node], []

    roles.register_local_role('mechanic', mechanic_role)

def before_controller_hook(*args, **kwargs):
    """Hook to inject suggestion-box Javascript into every page."""
    c.javascripts.append(('pokedex', 'pokedex-suggestions'))


class PokedexPlugin(PluginBase):
    def __init__(self, *args, **kwargs):
        """Stuff our helper module in the Pylons h object."""
        super(PokedexPlugin, self).__init__(*args, **kwargs)

        # XXX should we really be doing this here?
        h.pokedex = pokedex_helpers

    def controllers(self):
        import splinext.pokedex.controllers.pokedex
        import splinext.pokedex.controllers.pokedex_search
        import splinext.pokedex.controllers.pokedex_gadgets

        return {
            'dex': controllers.pokedex.PokedexController,
            'dex_search': controllers.pokedex_search.PokedexSearchController,
            'dex_gadgets': controllers.pokedex_gadgets.PokedexGadgetsController,
        }

    def template_dirs(self):
        return [
            (resource_filename(__name__, 'templates'), Priority.NORMAL)
        ]

    def static_dir(self):
        return resource_filename(__name__, 'public')

    def content_dir(self):
        return resource_filename(__name__, 'content')

    def hooks(self):
        return [
            ('routes_mapping',    Priority.NORMAL, add_routes_hook),
            ('after_setup',       Priority.NORMAL, after_setup_hook),
            ('before_controller', Priority.NORMAL, before_controller_hook),
        ]

    def links(self):
        return [
            PluginLink(u'Pokédex', url('/dex'), children=[
                PluginLink(u'Core pages', None, children=[
                    PluginLink(u'Pokémon', url(controller='dex', action='pokemon_list'), children=[
                        PluginLink(u'Awesome search', url(controller='dex_search', action='pokemon_search')),
                    ]),
                    PluginLink(u'Types', url(controller='dex', action='types_list')),
                    PluginLink(u'Abilities', url(controller='dex', action='abilities_list')),
                    PluginLink(u'Items', url(controller='dex', action='items_list')),
                    PluginLink(u'Natures', url(controller='dex', action='natures_list')),
                ]),
                PluginLink(u'Gadgets', None, children=[
                    PluginLink(u'Pokéball performance', url(controller='dex_gadgets', action='capture_rate')),
                ]),
            ]),
        ]

    def widgets(self):
        return [
            ('page_header', Priority.NORMAL, 'widgets/pokedex_lookup.mako'),
            ('head_tag',    Priority.NORMAL, 'widgets/pokedex_suggestion_css.mako'),
        ]