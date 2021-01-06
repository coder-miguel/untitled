// character stats
name = "Epinephrine"
class = "Fighter";
race = "Dwarf";
level = 1;

// base stats
//profMod = 2 + floor(level/5);
strMod = 3;
dexMod = 0;
conMod = 2;
intMod = 0;
wisMod = 1;

//// health stats
//maxHP = 10 + conMod + ((level - 1) * (6 + conMod));
//HP = maxHP;
//
//// attack variables
//hitBonus = profMod + strMod;
//
//// damage variables
//dmgDie = 8;
//dmgBonus = strMod;
//dmgType = DAMAGE_TYPE_SLASHING
//
//// defense variables
//AC = 18;
//
//// move and act variables
//move = 5;
//actions = 2;
//
//// initiative variables
//initiative = dexMod;
//initRoll = 0;
calc_stats(id);
