#--Checks if a given string is within a list of english words--#

# ARGUEMENTS:
# $a0 holds the string to compare to the list of viable words
#
# RETURN:     
# $v0 holds a one or zero,  where 1 means that the string is in the viable list while 0 means it is not in the list
# (Also assume that the string passed only has lowercase letters and has a length of four)



.data
.align 2
# Contains all the valid words
.globl viableWords
viableWords: .ascii "abed", "abet", "able", "ably", "abos", "abri", "abut", "abys", "aced", "aces", "ache", "achy", "acid", "acme", "acne", "acre", "acts", "acyl",
 "adze", "aeon", "aero", "aery", "aged", "ager", "ages", "ague", "ahem", "ahoy", "aide", "aids", "ails", "aims", "airs", "airy", "akin", "ales", "alit", "alky", "alms",
"aloe", "alps", "also", "alto", "alts", "alum", "ambo", "amen", "amid", "amok", "amps", "amyl", "ands", "anew", "anis", "ankh", "ante", "anti", "ants", "anus", "aped",
"apes", "apex", "apse", "arbs", "arch", "arcs", "arid", "aril", "arks", "arms", "army", "arts", "arty", "arum", "aryl", "asci", "ashy", "atom", "atop", "auks", "auld",
"aunt", "auto", "aver", "avid", "avow", "awed", "awes", "awls", "awns", "awry", "axed", "axel", "axes", "axil", "axis", "axle", "axon", "ayes", "back", "bade", "bags",
"baht", "bail", "bait", "bake", "bald", "bale", "balk", "balm", "band", "bane", "bang", "bank", "bans", "baps", "bard", "bare", "barf", "bark", "barn", "bars", "base",
"bash", "bask", "bate", "bath", "bats", "baud", "bawd", "bawl", "bays", "bead", "beak", "beam", "bean", "bear", "beat", "beau", "beck", "beds", "begs", "bels", "belt",
"bema", "bend", "bens", "bent", "berg", "berm", "best", "beta", "bets", "bevy", "beys", "bias", "bice", "bide", "bids", "bier", "bike", "bile", "bilk", "bind", "bine",
"bins", "bios", "bird", "bite", "bits", "blah", "blat", "bled", "blew", "blip", "bloc", "blot", "blow", "blue", "blur", "boar", "boas", "boat", "bock", "bode", "bods",
"body", "bogs", "bogy", "boil", "bola", "bold", "bole", "bolt", "bond", "bone", "bong", "bonk", "bony", "bops", "bora", "bore", "born", "bosh", "both", "bots", "bout",
"bowl", "bows", "boxy", "boys", "brad", "brae", "brag", "bran", "bras", "brat", "braw", "bray", "bred", "brew", "brie", "brig", "brim", "brio", "bris", "brit", "bros",
"brow", "brut", "buck", "buds", "bugs", "bulk", "bump", "bums", "bund", "bung", "bunk", "buns", "bunt", "buoy", "burg", "burl", "burn", "burp", "burs", "bury", "bush",
"busk", "bust", "busy", "buts", "buys", "byes", "byre", "byte", "cabs", "cade", "cadi", "cads", "cafe", "cage", "cagy", "cake", "caky", "calf", "calk", "calm", "came",
"camp", "cams", "cane", "cans", "cape", "capo", "caps", "carb", "card", "care", "cark", "carl", "carp", "cars", "cart", "case", "cash", "cask", "cast", "cate", "cats",
"caul", "cave", "cavy", "caws", "cays", "cedi", "ceil", "cent", "ceps", "cero", "chad", "chao", "chap", "char", "chat", "chaw", "chef", "chew", "chez", "chia", "chin",
"chip", "chis", "chit", "chon", "chop", "chow", "chub", "chug", "chum", "ciao", "cigs", "cine", "cist", "cite", "city", "clad", "clam", "clan", "clap", "claw", "clay",
"clef", "clew", "clip", "clit", "clod", "clog", "clop", "clot", "cloy", "club", "clue", "coal", "coat", "coax", "cobs", "coda", "code", "cods", "coed", "cogs", "coif",
"coil", "coin", "coir", "coke", "cola", "cold", "cols", "colt", "coly", "coma", "comb", "come", "comp", "cone", "coni", "conk", "cons", "cony", "cope", "cops", "copy",
"cord", "core", "cork", "corm", "corn", "cost", "cote", "cots", "coup", "cove", "cowl", "cows", "coxa", "cozy", "crab", "crag", "cram", "crap", "craw", "crew", "crib",
"crop", "crow", "crud", "crus", "crux", "cube", "cubs", "cuds", "cued", "cues", "culm", "cult", "cunt", "cups", "curb", "curd", "cure", "curl", "curs", "curt", "cusk",
"cusp", "cute", "cuts", "cwms", "cyan", "cyma", "cyme", "cyst", "czar", "dabs", "dace", "daft", "dago", "dahl", "dahs", "dais", "dale", "dals", "dame", "damn", "damp",
"dams", "dang", "dank", "daps", "dare", "dark", "darn", "dart", "dash", "date", "daut", "dawn", "days", "daze", "deaf", "deal", "dean", "dear", "debs", "debt", "deck",
"deco", "deft", "defy", "deli", "demo", "demy", "dens", "dent", "deny", "desk", "deva", "dews", "dewy", "dhal", "dhow", "dial", "dibs", "dice", "dick", "diel", "dies",
"diet", "digs", "dike", "dime", "dims", "dine", "ding", "dink", "dins", "dint", "diol", "dips", "dire", "dirk", "dirt", "disc", "dish", "disk", "ditz", "diva", "dive",
"docs", "doer", "does", "doge", "dogs", "dole", "dolt", "dome", "done", "dong", "dons", "dopa", "dope", "dopy", "dork", "dorm", "dory", "dose", "dost", "dote", "doth",
"dots", "dour", "dove", "down", "doxy", "doze", "dozy", "drab", "drag", "dram", "drat", "draw", "dray", "dreg", "drew", "drib", "drip", "drop", "drub", "drug", "drum",
"dual", "dubs", "duce", "duck", "duct", "duel", "dues", "duet", "dugs", "duke", "duly", "duma", "dumb", "dump", "dune", "dung", "dunk", "duns", "duos", "dupe", "dups",
"dura", "dusk", "dust", "duty", "dyer", "dyes", "dyke", "dyne", "each", "earl", "earn", "ears", "east", "easy", "eats", "ebon", "echo", "ecru", "ecus", "edgy", "edhs",
"edit", "efts", "egad", "egis", "egos", "elhi", "elks", "elms", "emfs", "emic", "emir", "emit", "emus", "ends", "enol", "enow", "envy", "eons", "epic", "epos", "eras",
"ergo", "ergs", "erns", "espy", "etas", "etch", "eths", "etic", "etna", "etui", "euro", "evil", "exam", "exit", "exon", "expo", "face", "fact", "fade", "fads", "fags",
"fail", "fain", "fair", "fake", "falx", "fame", "fane", "fang", "fans", "fare", "farm", "faro", "fart", "fast", "fate", "fats", "faun", "faux", "fawn", "fays", "faze",
"fear", "feat", "feck", "feds", "felt", "fend", "fens", "fern", "feta", "feud", "feus", "fiat", "fibs", "fico", "fids", "figs", "fila", "file", "film", "filo", "find",
"fine", "fink", "fins", "fire", "firm", "firs", "fish", "fist", "fits", "five", "fixt", "flab", "flag", "flak", "flam", "flan", "flap", "flat", "flaw", "flax", "flay",
"flea", "fled", "flew", "flex", "flic", "flip", "flit", "floc", "floe", "flog", "flop", "flow", "flub", "flue", "flus", "flux", "foal", "foam", "fobs", "foci", "foes",
"fogs", "fogy", "fohn", "foil", "fold", "folk", "fond", "font", "fops", "fora", "forb", "ford", "fore", "fork", "form", "fort", "foul", "four", "fowl", "foxy", "frag",
"frap", "frat", "fray", "fret", "frig", "frit", "froe", "frog", "from", "fuck", "fuds", "fuel", "fugs", "fuji", "fume", "fumy", "fund", "funk", "funs", "furl", "furs",
"fury", "fuse", "futz", "gabs", "gads", "gain", "gait", "gale", "gals", "game", "gams", "gamy", "gape", "gaps", "garb", "gars", "gash", "gasp", "gate", "gats", "gaud",
"gaum", "gaur", "gave", "gawk", "gawp", "gays", "gaze", "gear", "geld", "gels", "gems", "gens", "gent", "genu", "germ", "gest", "gets", "gibe", "gibs", "gift", "gild",
"gilt", "gimp", "gink", "gins", "gird", "girl", "girt", "gist", "gits", "give", "glad", "glen", "glia", "glib", "glim", "glob", "glom", "glop", "glow", "glue", "glum",
"glut", "gnat", "gnaw", "gnus", "goad", "goal", "goas", "goat", "gobs", "goby", "gods", "goer", "goes", "gold", "golf", "gone", "gore", "gory", "gosh", "gout", "gown",
"goys", "grab", "grad", "gram", "gran", "gray", "grew", "grey", "grid", "grim", "grin", "grip", "grit", "grot", "grow", "grub", "guan", "guar", "guck", "gulf", "gulp",
"gums", "gunk", "guns", "gush", "gust", "guts", "guvs", "guys", "gybe", "gyms", "gyps", "gyre", "gyri", "gyro", "hack", "hade", "haft", "hags", "hail", "hair", "haji",
"hake", "hale", "half", "halo", "halt", "hams", "hand", "hang", "hank", "haps", "hard", "hare", "hark", "harm", "harp", "hart", "hasp", "hast", "hate", "hats", "haul",
"have", "hawk", "haws", "hays", "haze", "hazy", "head", "heal", "heap", "hear", "heat", "heck", "heft", "heil", "heir", "held", "helm", "help", "hemp", "hems", "hens",
"herb", "herd", "herm", "hero", "hers", "hewn", "hews", "hick", "hide", "hike", "hila", "hilt", "hind", "hint", "hips", "hire", "hist", "hits", "hive", "hoar", "hoax",
"hobs", "hock", "hoed", "hoer", "hoes", "hogs", "hoke", "hold", "hole", "holm", "holt", "holy", "home", "hone", "honk", "hons", "hope", "hops", "hora", "horn", "hose",
"host", "hots", "hour", "hove", "howl", "hoys", "hubs", "hued", "hues", "huge", "hugs", "hula", "hulk", "hump", "hums", "hung", "hunk", "hunt", "hurl", "hurt", "husk",
"huts", "hymn", "hype", "hypo", "iamb", "ibex", "iced", "ices", "icky", "icon", "idea", "idem", "ides", "idle", "idly", "idol", "ikat", "ikon", "ilea", "ilex", "ilka",
"imps", "inch", "info", "inks", "inky", "inly", "into", "ions", "iota", "irks", "iron", "isle", "itch", "item", "jabs", "jack", "jade", "jags", "jail", "jamb", "jams",
"jane", "jape", "jarl", "jars", "jaws", "jays", "jean", "jerk", "jest", "jets", "jibe", "jibs", "jigs", "jilt", "jinx", "jism", "jive", "jobs", "jock", "joes", "joey",
"jogs", "john", "join", "joke", "jolt", "josh", "jota", "jots", "jowl", "joys", "juba", "judo", "juga", "jugs", "juke", "jump", "junk", "jury", "just", "jute", "juts",
"kagu", "kale", "kame", "kami", "kaon", "kaph", "kart", "kayo", "kays", "keas", "kegs", "kelp", "kemp", "keno", "kens", "kepi", "kept", "kern", "keto", "keys", "khan",
"khet", "kids", "kier", "kiln", "kilo", "kilt", "kina", "kind", "king", "kips", "kite", "kith", "kits", "kiva", "knap", "knar", "knew", "knit", "knob", "knop", "knot",
"know", "knur", "kohl", "kola", "kops", "kore", "kudo", "kune", "kyat", "labs", "lace", "lack", "lacs", "lacy", "lade", "lads", "lady", "lags", "laic", "laid", "lain",
"lair", "lake", "lakh", "laky", "lamb", "lame", "lamp", "lams", "land", "lane", "lank", "laps", "lard", "lark", "lars", "lase", "lash", "last", "late", "lath", "laud",
"lave", "lawn", "laws", "lays", "laze", "lazy", "lead", "leaf", "leak", "lean", "leap", "leas", "left", "legs", "leis", "lend", "leno", "lens", "lent", "lest", "lets",
"leva", "levy", "lewd", "leys", "liar", "libs", "lice", "lich", "lick", "lido", "lids", "lied", "lien", "lies", "lieu", "life", "lift", "like", "lima", "limb", "lime",
"limn", "limo", "limp", "limy", "line", "ling", "link", "lint", "liny", "lion", "lips", "lira", "lire", "lisp", "list", "lite", "live", "load", "loaf", "loam", "loan",
"lobe", "lobs", "loch", "loci", "lock", "lode", "loft", "loge", "logs", "logy", "loin", "lone", "long", "lope", "lops", "lord", "lore", "lory", "lose", "lost", "loth",
"loti", "lots", "loud", "lout", "love", "lows", "lube", "luce", "luck", "lude", "luge", "lugs", "lump", "lune", "lung", "lure", "lurk", "lush", "lust", "lute", "luvs",
"luxe", "lwei", "lynx", "lyre", "lyse", "mace", "macs", "made", "mads", "mage", "magi", "mags", "maid", "mail", "main", "make", "male", "malt", "mane", "mano", "mans",
"many", "maps", "marc", "mare", "mark", "marl", "mars", "mart", "mash", "mask", "mast", "mate", "math", "mats", "maul", "maws", "maxi", "mayo", "mays", "maze", "mazy",
"mead", "meal", "mean", "meat", "megs", "meld", "melt", "mend", "menu", "meow", "mesa", "mesh", "meta", "meth", "mewl", "mews", "mhos", "mica", "mice", "mick", "mien",
"mike", "mild", "mile", "milk", "milo", "mils", "milt", "mina", "mind", "mine", "mink", "mint", "minx", "mire", "mirk", "miry", "mise", "miso", "mist", "mite", "mixt",
"moan", "moas", "moat", "mobs", "mock", "mode", "mods", "moil", "mold", "mole", "mols", "molt", "moly", "monk", "mons", "mope", "mops", "mora", "more", "morn", "mort",
"mosh", "most", "mote", "moth", "mots", "moue", "move", "mown", "mows", "moxa", "much", "muck", "muds", "mugs", "mule", "muni", "muon", "murk", "muse", "mush", "musk",
"must", "mute", "myna", "myth", "nabs", "nags", "nail", "name", "naoi", "naos", "nape", "naps", "narc", "nard", "nark", "nary", "nave", "navy", "nays", "neap", "near",
"neat", "nebs", "neck", "nerd", "nest", "nets", "nevi", "news", "newt", "next", "nibs", "nice", "nick", "nigh", "nipa", "nips", "nits", "nobs", "nock", "node", "nods",
"noel", "noes", "nogs", "noir", "nope", "nori", "norm", "nose", "nosh", "nosy", "nota", "note", "nous", "nova", "nowt", "nubs", "nude", "nuke", "numb", "nuts", "oafs",
"oaks", "oars", "oath", "oats", "obey", "obis", "obit", "odes", "ofay", "ogle", "ogre", "ohia", "ohms", "oils", "oily", "oink", "okay", "okra", "oldy", "omen", "omit",
"once", "ones", "only", "onus", "onyx", "opah", "opal", "open", "opts", "opus", "oral", "orbs", "orca", "orcs", "ores", "orgy", "orts", "oryx", "ouch", "ouds", "ours",
"oust", "outs", "oval", "oven", "over", "ovum", "owed", "owes", "owls", "owns", "oxen", "oyez", "pace", "pack", "pact", "pads", "page", "paid", "pail", "pain", "pair",
"pale", "palm", "pals", "paly", "pane", "pang", "pans", "pant", "pare", "park", "pars", "part", "past", "pate", "path", "pats", "pave", "pawl", "pawn", "paws", "pays",
"peak", "peal", "pear", "peas", "peat", "peck", "pecs", "peds", "pegs", "pelf", "pelt", "pend", "pens", "pent", "peon", "peri", "perk", "perm", "pert", "peso", "pest",
"pets", "pews", "pfui", "phat", "phew", "phis", "phiz", "phot", "pica", "pick", "pics", "pied", "pier", "pies", "pigs", "pike", "pile", "pima", "pine", "ping", "pink",
"pins", "pint", "pion", "pish", "pita", "pith", "pits", "pity", "pixy", "plan", "plat", "play", "plea", "pled", "plie", "plod", "plot", "plow", "ploy", "plug", "plum",
"plus", "pock", "pods", "poem", "poet", "pois", "poke", "poky", "pole", "pols", "poly", "pome", "poms", "pond", "pone", "pong", "pons", "pony", "pore", "pork", "porn",
"port", "pose", "posh", "post", "posy", "pots", "pouf", "pour", "pout", "pram", "prat", "pray", "prey", "prig", "prim", "prod", "prof", "prog", "prom", "pros", "prow",
"pubs", "puce", "puck", "pugs", "puja", "puke", "pula", "pule", "puma", "punk", "puns", "punt", "puny", "pure", "purl", "push", "puts", "putz", "pyic", "pyre", "qoph",
"quad", "quag", "quay", "quid", "quin", "quip", "quit", "quiz", "quod", "race", "rack", "racy", "raft", "rage", "rags", "raid", "rail", "rain", "rake", "rale", "rami",
"ramp", "rams", "rand", "rang", "rani", "rank", "rant", "rape", "raps", "rapt", "rash", "rasp", "rate", "rats", "rave", "rays", "raze", "read", "real", "ream", "reap",
"recs", "redo", "reds", "refs", "regs", "rein", "reis", "rely", "rems", "rend", "rent", "repo", "reps", "rest", "rets", "revs", "rhea", "rias", "ribs", "rice", "rich",
"rick", "ride", "rids", "riel", "rife", "rift", "rigs", "rile", "rime", "rims", "rimy", "rind", "ring", "rink", "riot", "ripe", "rips", "rise", "risk", "rite", "rive",
"road", "roam", "roan", "robe", "robs", "rock", "rocs", "rode", "rods", "roes", "roil", "role", "romp", "rope", "ropy", "rose", "rosy", "rote", "roti", "rots", "rout",
"roux", "rove", "rows", "rube", "rubs", "ruby", "ruck", "rude", "rued", "rues", "rugs", "ruin", "rule", "rump", "rums", "rune", "rung", "runs", "runt", "ruse", "rush",
"rusk", "rust", "ruts", "ryes", "sack", "safe", "sage", "sago", "said", "sail", "sake", "sale", "salt", "same", "sand", "sane", "sang", "sank", "sari", "sark", "sate",
"sati", "save", "sawn", "scab", "scam", "scan", "scar", "scat", "scot", "scow", "scry", "scud", "scum", "scup", "seal", "seam", "sear", "seat", "sect", "sego", "self",
"semi", "send", "sent", "sept", "sera", "serf", "seta", "sewn", "sext", "sexy", "shad", "shag", "sham", "shat", "shay", "shea", "shed", "shew", "shim", "shin", "ship",
"shit", "shiv", "shod", "shoe", "shop", "shot", "show", "shul", "shun", "shut", "sick", "side", "sift", "sigh", "sign", "sild", "silk", "silo", "silt", "sine", "sing",
"sink", "sire", "site", "size", "skeg", "skep", "skew", "skid", "skim", "skin", "skip", "skit", "skua", "slab", "slag", "slam", "slap", "slat", "slaw", "slay", "sled",
"slew", "slid", "slim", "slip", "slit", "slob", "sloe", "slog", "slop", "slot", "slow", "slue", "slug", "slum", "slur", "slut", "smit", "smog", "smug", "smut", "snag",
"snap", "snip", "snit", "snob", "snog", "snot", "snow", "snub", "snug", "soak", "soap", "soar", "sock", "soda", "sofa", "soft", "soil", "sola", "sold", "sole", "soli",
"soma", "some", "song", "sorb", "sore", "sort", "souk", "soul", "soup", "sour", "sown", "soya", "spam", "span", "spar", "spat", "spay", "spaz", "spec", "sped", "spew",
"spic", "spin", "spit", "spot", "spry", "spud", "spun", "spur", "stab", "stag", "star", "stay", "stem", "step", "stew", "stir", "stop", "stow", "stub", "stud", "stun",
"such", "suck", "sued", "suet", "suit", "sulk", "sumo", "sump", "sung", "sunk", "surd", "sure", "surf", "swab", "swag", "swam", "swan", "swap", "swat", "sway", "swig",
"swim", "swop", "swot", "swum", "sybo", "syce", "sync", "syne", "tabs", "tach", "tack", "taco", "tads", "tags", "tail", "take", "talc", "tale", "talk", "tame", "tamp",
"tams", "tang", "tank", "tans", "tape", "taps", "tare", "tarn", "taro", "tarp", "tars", "task", "taws", "taxi", "teak", "teal", "team", "tear", "teas", "teds", "temp",
"tend", "tens", "tepa", "term", "tern", "than", "thaw", "them", "then", "they", "thin", "this", "thou", "thro", "thru", "thud", "thug", "thus", "tick", "tics", "tide",
"tidy", "tied", "tier", "ties", "tike", "tile", "tils", "time", "tine", "ting", "tins", "tiny", "tips", "tire", "toad", "toby", "toed", "toes", "tofu", "toga", "togs",
"toil", "toke", "tola", "told", "tole", "tolu", "tomb", "tome", "toms", "tone", "tong", "tons", "tony", "tope", "tops", "tore", "tori", "torn", "tors", "tory", "tosh",
"tour", "town", "tows", "towy", "toys", "trad", "tram", "trap", "tray", "trek", "trey", "trig", "trim", "trio", "trip", "trod", "trop", "troy", "true", "tsar", "tuba",
"tube", "tubs", "tuck", "tufa", "tugs", "tuna", "tune", "tuns", "turd", "turf", "turn", "tusk", "twig", "twin", "twos", "tyke", "type", "typo", "tyro", "udos", "ugly",
"ukes", "ulna", "umbo", "umps", "unci", "undo", "unit", "unto", "upas", "updo", "upon", "urea", "urge", "uric", "urns", "used", "user", "uvea", "vacs", "vail", "vain",
"vale", "vamp", "vane", "vans", "vars", "vary", "vase", "vast", "vats", "vatu", "veal", "veil", "vein", "vela", "veld", "vena", "vend", "vent", "verb", "vert", "very",
"vest", "veto", "vets", "vial", "vibe", "vice", "vide", "vied", "vies", "view", "vile", "vims", "vina", "vine", "vino", "viol", "visa", "vise", "vita", "void", "vole",
"volt", "vote", "vows", "wade", "wadi", "wads", "waft", "wage", "wags", "waif", "wail", "wain", "wait", "wake", "wale", "walk", "wand", "wane", "wans", "want", "waps",
"ward", "ware", "warm", "warn", "warp", "wars", "wart", "wary", "wash", "wasp", "wats", "wave", "wavy", "waxy", "ways", "weak", "weal", "wean", "wear", "webs", "weds",
"weft", "weir", "weld", "welt", "wend", "wens", "went", "wept", "wert", "west", "wets", "wham", "whap", "what", "when", "whet", "whey", "whim", "whip", "whir", "whit",
"whiz", "whoa", "whom", "whop", "whys", "wick", "wide", "wife", "wigs", "wild", "wile", "wilt", "wily", "wimp", "wind", "wine", "wing", "wink", "wino", "wins", "winy",
"wipe", "wire", "wiry", "wise", "wish", "wisp", "with", "wits", "woes", "woke", "woks", "wolf", "womb", "wonk", "wont", "wops", "word", "wore", "work", "worm", "worn",
"wort", "wots", "wove", "wrap", "wren", "writ", "wyes", "yack", "yaks", "yams", "yang", "yank", "yaps", "yard", "yare", "yarn", "yawl", "yawn", "yawp", "yaws", "yeah",
"yean", "year", "yeas", "yelp", "yens", "yeti", "yews", "yids", "yins", "yips", "ylem", "yoga", "yogh", "yogi", "yoke", "yoks", "yolk", "yond", "yoni", "yore", "your",
"yowl", "yuan", "yuca", "yuck", "yuks", "yule", "yurt", "zags", "zany", "zaps", "zarf", "zeal", "zebu", "zeds", "zero", "zest", "zeta", "zigs", "zinc", "zing", "zins",
"zips", "zits", "zoea", "zone", "zonk"

#testArray: .asciiz "10",  "20",  "30",  "40",  "50"


.text
# For testing purposes
#lw $a0,  Test

.globl isViableWord
isViableWord:

la $t2, viableWords

move $v0, $zero
# The length of the viable words array minus 1
addi $t4, $t4,  2374
# Set the count variable to zero
move $t1, $zero

#sb $t3, 0($a0)
#sb $t3, 1($a0)
#sb $t3, 2($a0)
#sb $t3, 3($a0)
lw $t3, -8($a0)  

viableLoop:
lw $t0, 0($t2)



# If we have reached maxed size of array,  end
beq $t1, $t4,  viableEnd
# If we have found a match in the array,  exit loop
beq $t0, $t3,  viableLoopEnd
addi $t1, $t1,  1
addi $t2, $t2,  4
j viableLoop

viableLoopEnd:
addi $v0, $v0,  1

viableEnd:
# For testing purposes
#move $t3, $v0
#li $v0, 1
#move $a0, $t3
#syscall
move $t0, $zero
jr $ra

