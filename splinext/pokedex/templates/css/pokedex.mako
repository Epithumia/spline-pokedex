/*** General ***/

/* Pokémon sprite link grid */
a.dex-icon-link { display: inline-block; border: 1px solid transparent; }
a.dex-icon-link:hover { border: 1px solid #bfd3f1; background: #e6eefa; }
a.dex-icon-link.selected { border: 1px solid #95b7ea; background: #bfd4f2; }
a.dex-box-link { display: inline-block; margin: 0.25em; border: 1px solid transparent; }
a.dex-box-link:hover { border: 1px solid #bfd3f1; background: #e6eefa; }
a.dex-box-link.selected { border: 1px solid #95b7ea; background: #bfd4f2; }

/* Cool three-column layout */
.dex-column-container { clear: both; overflow: hidden /* float context */; margin-top: 1em; }
.dex-column { float: left; width: 32.666%; margin-left: 1%; }
.dex-column:first-child { margin-left: 0; }
.dex-column-2x { float: left; width: 66.333%; margin-left: 1%; }
.dex-column-2x:first-child { margin-left: 0; }

/* Type damage colors */
.dex-damage-taken-0   { font-weight: bold; color: #66c; }
.dex-damage-taken-25  { font-weight: bold; color: #6cc; }
.dex-damage-taken-50  { font-weight: bold; color: #6c6; }
.dex-damage-taken-100 { font-weight: bold; color: #999; }
.dex-damage-taken-200 { font-weight: bold; color: #c66; }
.dex-damage-taken-400 { font-weight: bold; color: #c6c; }
.dex-damage-dealt-0   { font-weight: bold; color: #66c; }
.dex-damage-dealt-25  { font-weight: bold; color: #c6c; }
.dex-damage-dealt-50  { font-weight: bold; color: #c66; }
.dex-damage-dealt-100 { font-weight: bold; color: #999; }
.dex-damage-dealt-200 { font-weight: bold; color: #6c6; }
.dex-damage-dealt-400 { font-weight: bold; color: #6cc; }

/* Move priorities, used most prominently in the move table */
.dex-priority-fast { font-weight: bold; color: green; }
.dex-priority-slow { font-weight: bold; color: red; }

/* Links to Pokémon search */
dd .dex-subtle-search-link { visibility: hidden; }
dd:hover .dex-subtle-search-link { visibility: visible; }


/*** General tables ***/

/* Columns woo */
col.dex-col-icon        { width: 32px; }
col.dex-col-name        { width: 10em; }
col.dex-col-link        { width: 16px; }
col.dex-col-max-exp     { width: 7em; }
col.dex-col-ability     { width: 8em; }
col.dex-col-egg-group   { width: 7em; }
col.dex-col-height      { width: 5em; }
col.dex-col-weight      { width: 6em; }
col.dex-col-species     { width: 8em; }
col.dex-col-color       { width: 5em; }
col.dex-col-habitat     { width: 9em; }
col.dex-col-stat        { width: 3em; }
col.dex-col-stat-name   { width: 10em; }
col.dex-col-stat-bar    { width: auto; }
col.dex-col-stat-pctile { width: 5em; }
col.dex-col-stat-result { width: 5em; }
col.dex-col-effort      { width: 8em; }
col.dex-col-type        { width: 3em; }
col.dex-col-version     { width: 3.5em; }  /* two versions (32px < 33px == 3em) plus 0.17em padding < 3.5em */
col.dex-col-encounter-name { width: 10em; }
col.dex-col-encounter-version { width: 12em; }
col.dex-col-first-version { border-left:  1px solid #b4c7e6; }
col.dex-col-last-version  { border-right: 1px solid #b4c7e6; }

/* Generic Pokémon and move lists; originally used for a Pokémon's moves, or a move's Pokémon */
table.dex-pokemon-moves {;}
table.dex-pokemon-pokemon-moves { width: 100%; }
table.dex-pokemon-moves td { padding: 0.33em; vertical-align: middle; text-align: center; }
table.dex-pokemon-moves th { padding: 0.33em 0.17em; text-align: center; }
table.dex-pokemon-moves tr.subheader-row th { padding: 0.17em 0.33em; text-align: left; }
table.dex-pokemon-moves td.egg { padding: 0 /* egg sprite consumes a lot of space, so let it extend into padding */; }
table.dex-pokemon-moves td.icon { padding: 0 /* icons consume a lot of space, so let em extend into padding */; }
table.dex-pokemon-moves td.name { white-space: nowrap; }
table.dex-pokemon-moves td.max-exp { text-align: right; }
table.dex-pokemon-moves td.effect { font-size: 0.8em; text-align: left; }
table.dex-pokemon-moves td.effect p { margin: 0; }
table.dex-pokemon-moves td.tutored { white-space: nowrap; }
table.dex-pokemon-moves .no-tutor { visibility: hidden; }
table.dex-pokemon-moves td.type2 { text-align: left; }
table.dex-pokemon-moves td.ability { font-size: 0.75em; padding: 0.25em; white-space: nowrap; }
table.dex-pokemon-moves td.egg-group { font-size: 0.75em; padding: 0.25em; }
table.dex-pokemon-moves td.stat { text-align: right; }
table.dex-pokemon-moves td.size { text-align: right; }
table.dex-pokemon-moves td.color { }
table.dex-pokemon-moves td.species { }
table.dex-pokemon-moves td.effort { font-size: 0.75em; padding: 0.25em; text-align: left; }

/* "Sorting" Pokémon search results by evolution chain */
table.dex-pokemon-moves tr.fake-result td { opacity: 0.25; }
table.dex-pokemon-moves tr.chain-divider { border-top: 2px solid #b4c7e6; }
table.dex-pokemon-moves tr.evolution-depth-0 td.name { text-align: left; }
table.dex-pokemon-moves tr.evolution-depth-1 td.name { padding-left: 1em; text-align: left; }
table.dex-pokemon-moves tr.evolution-depth-2 td.name { padding-left: 2em; text-align: left; }
table.dex-pokemon-moves tr.evolution-depth-3 td.name { padding-left: 3em; text-align: left; }

/* JavaScript filtering/sorting */
table.dex-pokemon-moves tr.js-dex-pokemon-moves-controls .js-label { font-size: 0.67em; }
table.dex-pokemon-moves tr.js-dex-pokemon-moves-controls:hover { background: transparent; }
table.dex-pokemon-moves tr.js-dex-pokemon-moves-controls td:hover { cursor: pointer; background: #e6eefa; }
table.dex-pokemon-moves tr.js-dex-pokemon-moves-controls td.js-not-a-button:hover { cursor: default; background: transparent; }
table.dex-pokemon-moves tr.js-dex-pokemon-moves-controls td.js-sorted-by { background: #f0efe6; }
table.dex-pokemon-moves tr:nth-child(2n) td.js-sorted-by { background: #f0efe6; }
table.dex-pokemon-moves tr:nth-child(2n+1) td.js-sorted-by { background: #f6f4ea; }
table.dex-pokemon-moves tr.better-move-type:nth-child(2n) td.type,
table.dex-pokemon-moves tr.better-move-stat:nth-child(2n) td.class { background: #afcfaf; }
table.dex-pokemon-moves tr.better-move-type:nth-child(2n+1) td.type,
table.dex-pokemon-moves tr.better-move-stat:nth-child(2n+1) td.class { background: #c0d8c0; }


/*** Individual pages -- shared ***/

/* Prev/current/next header */
#dex-header { overflow: hidden; /* new float context */ text-align: center; line-height: 24px; /* keep buttons at least 24px tall */ }
#dex-header-prev { float: left;  text-align: left; }
#dex-header-next { float: right; text-align: right; }
#dex-header-prev, #dex-header-next { width: 15em; min-height: 24px; margin: 0; }
#dex-header-prev img, #dex-header-next img { vertical-align: middle; }
#dex-header ul.inline-menu {  line-height: 1.2; }
#dex-header + h1 { margin-top: 0.25em; }

/* Header sublinks, e.g. pokemon | flavor | locations */
ul.inline-menu { text-align: middle; }
ul.inline-menu > li { display: inline; }
ul.inline-menu > li:after { content: ' | '; }
ul.inline-menu > li:last-child:after { content: none; }

/* Top section, with the portrait and stuff on the right side */
.dex-page-portrait { float: left; width: 15em; min-height: 10em; padding-bottom: 1em; text-align: center; }
.dex-page-portrait p { margin: 0.25em 0; line-height: 1; }
.dex-page-beside-portrait:after { display: block; clear: both; content: ""; }
p#dex-page-name { font-size: 2em; margin: 0.12em 0; }
#dex-pokemon-forme { font-size: 1.25em; font-weight: bold; }
#dex-pokemon-portrait-sprite { height: 80px; width: 80px; margin: 0.33em auto; padding: 7px; line-height: 80px; vertical-align: middle; text-align: center; background: url(/dex/media/chrome/sprite-frame.png) center center no-repeat; }

/* List of types with damage (or whatever) below */
ul.dex-type-list { overflow: hidden /* new float context */; margin-bottom: 2em; }
ul.dex-type-list li { display: inline-block; text-align: center; padding: 0.125em; }
ul.dex-type-list li img { display: block; margin-bottom: 0.25em; }

/* Size comparison -- used by Pokémon and flavor */
.dex-size { height: 120px; padding-bottom: 2.5em /* for -value */; overflow: hidden /* new float context */}
.dex-size img { clip: 8px; position: absolute; bottom: 0; image-rendering: -moz-crisp-edges; -ms-interpolation-mode: nearest-neighbor; }
.dex-size input[type='text'] { text-align: right; }
.dex-size .dex-size-trainer,
.dex-size .dex-size-pokemon { display: block; position: relative; float: left; height: 100%; width: 50%; text-align: left; }
.dex-size .dex-size-trainer { text-align: right; }
.dex-size .dex-size-pokemon { text-align: left; }
.dex-size .dex-size-trainer img { right: 0.25em; }
.dex-size .dex-size-pokemon img { left: 0.25em; }
.dex-size .js-dex-size-raw { display: none; }
.dex-size .dex-size-value { position: absolute; height: 2em; margin: 0; line-height: 1; padding: 0.25em; bottom: -2.5em; }
.dex-size .dex-size-trainer .dex-size-value { right: 0.25em; }
.dex-size .dex-size-pokemon .dex-size-value { left: 0.25em; }

/* reST effect prose (for moves, abilities, etc) */
.dex-effect a { font-weight: normal; }


/*** Individual pages ***/

/* Pokémon page -- ability list */
dl.pokemon-abilities p { margin: 0; padding: 0; }

/* Pokémon page -- grid of compatible breeding partners */
ul.dex-pokemon-compatibility { max-height: 136px /* four rows of icons plus borders */; overflow: auto; }

/* Pokémon page -- wild held items */
table.dex-pokemon-held-items { width: 100%; }
table.dex-pokemon-held-items .versions { width: 48px /* three versions */; padding-right: 0.5em; }
table.dex-pokemon-held-items .rarity { width: 4em; padding-right: 0.5em; text-align: right; }
table.dex-pokemon-held-items tr.new-version { border-top: 1px dotted #c0c0c0; }
table.dex-pokemon-held-items tbody tr:first-child.new-version { border-top: none; }

/* Pokémon page -- evolution chain table */
table.dex-evolution-chain { width: 100%; table-layout: fixed; border-collapse: separate; border-spacing: 0.5em; empty-cells: hide; }
table.dex-evolution-chain td { padding: 0.5em; vertical-align: middle; border: 1px solid #d8d8d8; background: #f0f0f0; }
table.dex-evolution-chain td:hover { border: 1px solid #bfd3f1; background: #e6eefa; }
table.dex-evolution-chain td.selected { border: 1px solid #95b7ea; background: #bfd4f2; }
.dex-evolution-chain-method { display: block; overflow: hidden; font-size: 0.8em; line-height: 1.25em; }
.dex-evolution-chain-pokemon { padding-top: 8px /* bump icon up a bit */; display: block; font-weight: bold; }
.dex-evolution-chain-pokemon img { float: left; margin-top: -8px /* fills link's top padding */; padding-right: 0.33em; }

/* Pokémon page -- stats table */
table.dex-pokemon-stats { width: 100%; }
table.dex-pokemon-stats th label { display: block; text-align: right; font-weight: normal; color: #2457a0; }
table.dex-pokemon-stats th input { text-align: left; }
table.dex-pokemon-stats .dex-pokemon-stats-bar-container { background: #f8f8f8; }
table.dex-pokemon-stats .dex-pokemon-stats-bar { padding: 0.33em; border: 1px solid #d8d8d8; background: #f0f0f0; }
table.dex-pokemon-stats td.dex-pokemon-stats-pctile { text-align: right; }
table.dex-pokemon-stats td.dex-pokemon-stats-result { text-align: right; }

/* Pokémon page -- simple-encounters list */
.dex-simple-encounters-terrain { margin-bottom: 0.5em; }
dl.dex-simple-encounters dd img { vertical-align: bottom; }
dl.dex-simple-encounters ul { display: inline; }
dl.dex-simple-encounters ul li { display: inline; }
dl.dex-simple-encounters ul li:after { content: '; '; }
dl.dex-simple-encounters ul li:last-child:after { content: ''; }

/* Pokémon flavor page -- RBY sprite needs doublesizin' */
td.dex-pokemon-flavor-rby-back { vertical-align: middle; }
.dex-pokemon-flavor-rby-back img { width: 64px; image-rendering: -moz-crisp-edges; -ms-interpolation-mode: nearest-neighbor; }

/* Pokémon flavor page -- flavor text */
.dex-pokemon-flavor-generation { position: absolute; line-height: 1.5; }
dl.dex-pokemon-flavor-text + .dex-pokemon-flavor-generation { padding-top: 1.5em; }
dl.dex-pokemon-flavor-text + .dex-pokemon-flavor-generation + dl.dex-pokemon-flavor-text { padding-top: 1.5em; }
dl.dex-pokemon-flavor-text dt { width: 7em /* enough for gen, two versions, and space */; }
dl.dex-pokemon-flavor-text dd { padding-left: 7.5em; }

/* Location page and Pokémon location page -- entire bigass table */
table.dex-encounters td { padding-left: 0.5em; padding-right: 0.5em; vertical-align: top; }
table.dex-encounters td.location { vertical-align: top; }
table.dex-encounters th.location { vertical-align: top; text-align: left; }
.dex-location-area { font-size: 0.8em; font-style: italic; color: black; }
.dex-encounter-condition-group { padding: 0.5em 0; }
.dex-encounter-condition-group + .dex-encounter-condition-group { border-top: 1px solid #404040; }
.dex-encounter-conditions + .dex-encounter-conditions { margin-top: 0.5em; }
.dex-encounter-conditions .dex-encounter-icon { float: left; width: 24px; height: 24px; line-height: 24px; text-align: center; overflow: hidden;}
.dex-encounter-conditions .dex-encounter-icon img { vertical-align: middle; }
.dex-encounter-conditions .dex-encounter-rarity { float: right; }
.dex-encounter-conditions .dex-rarity-bar { position: relative; overflow: auto; font-size: 0.83em; height: 1em; line-height: 1; margin-top: 0.25em; background: #e8e8e8; border: 1px solid #96bbf2; }
.dex-encounter-conditions .dex-rarity-bar-fill { height: 100%; background: #96bbf2; }
.dex-encounter-conditions .dex-rarity-bar-fills { float: left; height: 100%; background: #96bbf2; }
.dex-encounter-conditions .dex-rarity-bar-fills + .dex-rarity-bar-fills { margin-left: -1px; border-left: 1px solid #b3cef6; }
.dex-encounter-conditions .dex-rarity-bar-fills:hover { background: #668dcc; }
.dex-encounter-conditions .dex-rarity-bar-value { position: absolute; height: 100%; top: 0; right: 0; color: #808080; vertical-align: bottom; }

/* Item page -- pocket list at the top */
ul#dex-item-pockets { text-align: center; }
ul#dex-item-pockets li { display: inline-block; }
ul#dex-item-pockets li img { padding: 4px; }


/*** Lists ***/

table.dex-ability-list td { padding: 0.33em 0.5em; }
table.dex-ability-list p { margin: 0; padding: 0; }

table.dex-nature-list td { padding: 0.33em 1em 0.33em 0.75em; }
table.dex-nature-list td.flavor { text-align: right; }

table.dex-type-chart td { text-align: center; }
table.dex-type-chart td.dex-damage-dealt-100 { color: #e0e0e0; }


/*** Searches ***/

/* Pokémon search -- move versions */
table#dex-pokemon-search-move-versions td { padding-right: 2em; }


/*** Gadgets ***/

/* Pokéball performance results */
table.dex-capture-rates td { vertical-align: middle; }
table.dex-capture-rates th.item { text-align: left; }
table.dex-capture-rates td.chance { text-align: right; }
table.dex-capture-rates td.condition { font-size: 0.8em; font-style: italic; }
table.dex-capture-rates td.expected-attempts { text-align: right; padding-right: 1em /* title is wide; offset a bit */; }
table.dex-capture-rates tr.inactive td { color: #909090; }
div.dex-capture-rate-graph { display: inline-block; position: relative; width: 10em; height: 1.3em; background: #79cc66; }
div.dex-capture-rate-graph-bar { float: left; height: 100%; }
p.dex-capture-rate-legend span { padding: 0.25em; }
.wobble0 { background: #cc6666; }
.wobble1 { background: #d88c8c; }
.wobble2 { background: #e5b2b2; }
.wobble3 { background: #f2d9d9; }
.wobble4 { background: #79cc66; }
table.dex-capture-rates tr.inactive div.dex-capture-rate-graph { opacity: 0.25; }

/* Pokéball performance -- HP bar for HP-remaining input */
.dex-hp-bar { display: inline-block; height: 3px; width: 48px; margin: 0.25em; padding: 6px 2px 7px 16px /* 4px of extra vertical padding for click space */; vertical-align: middle; background: url(${h.static_uri('pokedex', 'images/hp-bar.png')}) center left no-repeat; }
.dex-hp-bar .dex-hp-bar-bar { width: 100%; height: 100%; }
.dex-hp-bar .dex-hp-bar-bar.green  { background-color: #18c31f; }
.dex-hp-bar .dex-hp-bar-bar.yellow { background-color: #d7ac00; }
.dex-hp-bar .dex-hp-bar-bar.red    { background-color: #be2821; }


/*** Static pages ***/

/* Big lookup box above the Pokédex instructions */
#big-pokedex-lookup { font-size: 2em; text-align: center; }
#big-pokedex-lookup input { font-size: 1em; }


/*** Cheat codes ***/

/* Cheat code unlock page */
#dex-cheat-unlocked { overflow: hidden /* float containment */; width: 60%; margin: auto; margin-top: 10em; }
#dex-cheat-unlocked .dex-cheat-unlocked-left { float: left; }
#dex-cheat-unlocked .dex-cheat-unlocked-right { float: right; }
#dex-cheat-unlocked .dex-cheat-unlocked-line1 { font-size: 48px; font-weight: bold; text-align: center; text-transform: uppercase; }
#dex-cheat-unlocked .dex-cheat-unlocked-line2 { font-size: 34px; font-weight: bold; text-align: center; text-transform: uppercase; }
#dex-cheat-list { margin-top: 1em; margin-bottom: 5em; text-align: center; }
#dex-cheat-list li { display: inline; padding: 0.5em 1em; }
#dex-cheat-list li.this-cheat { font-weight: bold; }

/* obdurate cheat code */
dd.dex-obdurate { margin-bottom: 1em; }