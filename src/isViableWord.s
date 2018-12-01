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
# There 826 words in this array
viableWords: .ascii "agar", "agas", "agio", "agma", "aims", "airs", "amas", "amia", "amir", "amis", "aria", "arms", "gama", "gams", "gars", "goas", 
"gram", "maar", "magi", "mags", "mair", "mars", "moas", "mora", "oars", "ogam", "osar", "raga", "ragi", "rags", "raia", "rami", "rams", "rias", "roam", 
"saga", "sago", "sari", "sima", "soar", "soma", "sora", "abos", "abri", "ambo", "arbs", "bags", "bams", "barm", "bars", "bias", "bigs", "bima", "bios", 
"boar", "boas", "bogs", "bora", "brag", "bras", "brig", "brim", "brio", "bris", "bros", "gabs", "gamb", "garb", "gibs", "gobs", "grab", "iamb", "isba", 
"mibs", "mobs", "obia", "obis", "orbs", "ribs", "robs", "sorb", "arco", "arcs", "asci", "cams", "cars", "ciao", "cigs", "cogs", "coir", "coma", "corm", 
"cors", "crag", "cram", "cris", "macs", "marc", "mica", "mocs", "ocas", "orca", "orcs", "rocs", "scag", "scam", "scar", "ados", "aids", "amid", "arid", 
"dago", "dags", "dais", "dams", "digs", "dims", "dogs", "doms", "dorm", "dors", "drag", "dram", "gadi", "gads", "gids", "gird", "goad", "gods", "grad", 
"grid", "mads", "maid", "mids", "modi", "mods", "orad", "rads", "raid", "rids", "road", "rods", "sadi", "said", "sard", "soda", "sord", "aero", "ager", 
"ages", "amie", "ares", "arse", "ears", "egis", "egos", "emir", "eras", "ergo", "ergs", "eros", "gaes", "game", "gear", "gems", "germ", "gies", "goer", 
"goes", "gore", "ires", "maes", "mage", "mare", "megs", "mesa", "mire", "mise", "more", "ogre", "omer", "ores", "rage", "rase", "ream", "regs", "reis", 
"rems", "rime", "rise", "roes", "rose", "sage", "same", "seam", "sear", "sego", "semi", "sera", "sire", "some", "sore", "arfs", "fags", "fair", "farm", 
"faro", "fiar", "figs", "firm", "firs", "foam", "fogs", "fora", "form", "frag", "frig", "frog", "from", "oafs", "rifs", "sofa", "agio", "agog", "gags", 
"gams", "gars", "giga", "gigs", "giro", "goas", "gram", "grig", "grim", "grog", "magi", "mags", "migg", "migs", "mogs", "ogam", "ragi", "rags", "rigs", 
"sago", "smog", "gash", "ghis", "gosh", "hags", "hair", "hams", "harm", "hoar", "hogs", "hora", "mash", "mhos", "mosh", "ohia", "ohms", "rash", "rhos", 
"shag", "sham", "shim", "shmo", "shog", "shri", "sigh", "agio", "aims", "airs", "amir", "amis", "giro", "grim", "iris", "magi", "mair", "migs", "miri", 
"mirs", "miso", "ragi", "rami", "rias", "rigs", "rims", "sari", "sima", "sori", "jags", "jams", "jars", "jiao", "jigs", "jism", "jogs", "soja", "amok", 
"arks", "irks", "kami", "kirs", "koas", "kois", "kors", "kris", "mako", "mark", "mask", "mirk", "mosk", "oaks", "okas", "okra", "raki", "risk", "saki", 
"sark", "skag", "skim", "soak", "ails", "alms", "also", "aril", "gals", "gaol", "girl", "glia", "glim", "glom", "goal", "lags", "lair", "lams", "lari", 
"lars", "liar", "lima", "limo", "lira", "loam", "logs", "mail", "marl", "milo", "mils", "moil", "mola", "mols", "oils", "oral", "rail", "rial", "roil", 
"sail", "sial", "silo", "slag", "slam", "slim", "slog", "soil", "sola", "soli", "aims", "amir", "amis", "ammo", "arms", "gams", "gram", "grim", "imam", 
"magi", "mags", "maim", "mair", "mars", "migs", "mirs", "miso", "moas", "mogs", "momi", "moms", "mora", "mors", "ogam", "rami", "rams", "rims", "roam", 
"roms", "sima", "smog", "soma", "agin", "agon", "ains", "airn", "amin", "anis", "gain", "gins", "girn", "gnar", "gran", "grin", "inro", "ions", "iron", 
"main", "mano", "mans", "mina", "moan", "mons", "morn", "nags", "naoi", "naos", "nims", "nogs", "noir", "noma", "noms", "nori", "norm", "rain", "rang", 
"rani", "ring", "rins", "roan", "sain", "sang", "sign", "sing", "snag", "snog", "song", "sorn", "agio", "giro", "goas", "goos", "miso", "moas", "mogs", 
"moor", "moos", "mora", "mors", "oars", "ogam", "osar", "roam", "roms", "room", "sago", "smog", "soar", "soma", "sora", "sori", "amps", "gamp", "gaps", 
"gasp", "gimp", "gips", "gorp", "grip", "imps", "maps", "mops", "pair", "pams", "pars", "pias", "pigs", "pima", "piso", "pois", "poms", "pram", "prao", 
"prig", "prim", "proa", "prog", "prom", "pros", "ramp", "raps", "rasp", "rips", "romp", "samp", "simp", "soap", "spam", "spar", "airs", "amir", "arms", 
"gars", "giro", "gram", "grim", "mair", "mars", "mirs", "mora", "mors", "oars", "orra", "osar", "ragi", "rags", "rami", "rams", "rias", "rigs", "rims", 
"roam", "roar", "roms", "sari", "soar", "sora", "sori", "aims", "airs", "amis", "arms", "gams", "gars", "goas", "isms", "mags", "mars", "mass", "migs", 
"mirs", "miso", "miss", "moas", "mogs", "mors", "moss", "oars", "osar", "ossa", "rags", "rams", "rias", "rigs", "rims", "roms", "sago", "sags", "sari", 
"sima", "sims", "sirs", "smog", "soar", "soma", "sora", "sori", "sris", "airt", "aits", "arts", "atom", "gait", "gast", "gats", "girt", "gist", "gits", 
"goat", "grat", "grit", "grot", "iota", "mart", "mast", "mats", "mist", "moat", "mort", "most", "mots", "oast", "oats", "omit", "orts", "rato", "rats", 
"riot", "rota", "roti", "rots", "sati", "smit", "sort", "stag", "star", "stir", "stoa", "tags", "tams", "taos", "taro", "tars", "tiro", "toga", "togs", 
"toms", "tora", "tori", "tors", "tram", "trig", "trim", "trio", "tsar", "amus", "arum", "gaum", "gaur", "grum", "guar", "gums", "mugs", "mura", "ours", 
"ruga", "rugs", "rums", "smug", "sour", "sumo", "sura", "ursa", "arvo", "avos", "vagi", "vair", "vars", "viga", "vigs", "vims", "visa", "grow", "maws", 
"mows", "raws", "rows", "swag", "swam", "swig", "swim", "wags", "wair", "warm", "wars", "wigs", "wogs", "worm", "axis", "maxi", "moxa", "oxim", "airy", 
"army", "gamy", "gays", "gory", "goys", "gray", "gyms", "gyri", "gyro", "mayo", "mays", "miry", "orgy", "rays", "rimy", "rosy", "ryas", "sagy", "soya", 
"yagi", "yams", "yoga", "yogi", "izar", "zags", "zigs", "zori"

#testArray: .asciiz "10",  "20",  "30",  "40",  "50"


.text
# For testing purposes
#lw $a0,  Test

.globl isViableWord
isViableWord:

la $t2, viableWords

move $v0, $zero
# The length of the viable words array minus 1
addi $t4, $t4,  825
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

