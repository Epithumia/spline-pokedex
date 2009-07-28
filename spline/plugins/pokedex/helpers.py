# encoding: utf8
"""Small library of bits and pieces useful to the Web interface that don't
really belong in the pokedex core.
"""

from __future__ import absolute_import

import math
import re

import pokedex.formulae as formulae
from pokedex.roomaji import romanize
import spline.lib.helpers as h

def filename_from_name(name):
    """Shorten the name of a whatever to something suitable as a filename.

    e.g. Water's Edge -> waters-edge
    """
    name = name.lower()
    name = re.sub('[ _]+', '-', name)
    name = re.sub('[^-a-z0-9]', '', name)
    return name

def pokedex_img(src, **attr):
    return h.HTML.img(src=h.url_for(controller='dex', action='media', path=src), **attr)


# XXX Should these be able to promote to db objects, rather than demoting to
# strings and integers?  If so, how to do that without requiring db access
# from here?
def generation_icon(generation):
    """Returns a generation icon, given a generation number."""
    # Convert generation to int if necessary
    if not isinstance(generation, int):
        generation = generation.id

    return pokedex_img('versions/generation-%d.png' % generation,
                       alt="Generation %d" % generation)

def version_icons(*versions):
    """Returns some version icons, given a list of version names."""
    version_icons = ''
    for version in versions:
        # Convert version to string if necessary
        if not isinstance(version, basestring):
            version = version.name

        version_filename = filename_from_name(version)
        version_icons += pokedex_img('versions/%s.png' % version_filename,
                                     alt=version)

    return version_icons


def pokemon_sprite(pokemon, prefix='platinum', **attr):
    """Returns an <img> tag for a Pokémon sprite."""

    # Kinda gross, but it's entirely valid to pass None as a form
    form = attr.pop('form', pokemon.forme_name)
    if form == pokemon.forme_name and not pokemon.forme_base_pokemon_id:
        # Don't use default form's name as part of the filename
        form = None

    if form:
        alt_text = "%s (%s)" % (pokemon.name, form)
        filename = '%d-%s.png' % (pokemon.national_id, form)
    else:
        alt_text = pokemon.name
        filename = '%d.png' % pokemon.national_id

    attr.setdefault('alt', alt_text)
    attr.setdefault('title', alt_text)

    return pokedex_img("%s/%s" % (prefix, filename), **attr)

def pokemon_link(pokemon, content=None, **attr):
    """Returns a link to a Pokémon page.

    `pokemon` may be a name or a Pokémon object."""

    # Content defaults to the name of the Pokémon
    if not content:
        content = pokemon.name

    # Kinda gross, but it's entirely valid to pass None as a form
    form = attr.pop('form', pokemon.forme_name)
    if form == pokemon.forme_name and not pokemon.forme_base_pokemon_id:
        # Don't use default form's name as part of the link
        form = None

    url_kwargs = {}
    if form:
        # Don't want a ?form=None, so just only pass a form at all if there's
        # one to pass
        url_kwargs['form'] = form

    action = 'pokemon'
    if pokemon.normal_form.form_group and not pokemon.normal_form.formes:
        # If a Pokémon does not have real (different species) forms, e.g.
        # Unown and its letters, then a form link only makes sense if it's to a
        # flavor page.
        action = 'pokemon_flavor'

    return h.HTML.a(
        content,
        href=h.url_for(controller='dex', action=action,
                       name=pokemon.name.lower(), **url_kwargs),
        **attr
        )


def type_icon(type):
    return pokedex_img('chrome/types/%s.png' % type.name, alt=type.name)


def item_link(item):
    """Returns a link to the requested item."""
    filename = filename_from_name(item.name)
    return pokedex_img("items/%s.png" % filename,
                       alt=item.name, title=item.name) + item.name


# Type efficacy, from percents to Unicode fractions
type_efficacy_label = {
    0: '0',
    25: u'¼',
    50: u'½',
    100: '1',
    200: '2',
    400: '4',
}

# Gender rates, translated from -1..8 to useful text
gender_rate_label = {
    -1: u'genderless',
    0: u'always male',
    1: u'⅞ male, ⅛ female',
    2: u'¾ male, ¼ female',
    3: u'⅝ male, ⅜ female',
    4: u'½ male, ½ female',
    5: u'⅜ male, ⅝ female',
    6: u'¼ male, ¾ female',
    7: u'⅛ male, ⅞ female',
    8: u'always female',
}

def format_height_metric(height):
    """Formats a height in decimeters as M m."""
    return "%.1f m" % (height / 10.0)

def format_height_imperial(height):
    """Formats a height in decimeters as F'I"."""
    return "%d'%.1f\"" % (
        height * 0.32808399,
        (height * 0.32808399 % 1) * 12,
    )

def format_weight_metric(weight):
    """Formats a weight in hectograms as K kg."""
    return "%.1f kg" % (weight / 10.0)

def format_weight_imperial(weight):
    """Formats a weight in hectograms as L lb."""
    return "%.1f lb" % (weight / 10 * 2.20462262)

def scale_sizes(size_dict, dimensions=1):
    """Normalizes a list of sizes so the largest is 1.0.

    Use `dimensions` if the sizes are non-linear, i.e. 2 for scaling area.
    """

    # x -> (x/max)^(1/dimensions)
    max_size = float(max(size_dict.values()))
    scaled_sizes = dict()
    for k, v in size_dict.items():
        scaled_sizes[k] = math.pow(v / max_size, 1.0 / dimensions)
    return scaled_sizes
