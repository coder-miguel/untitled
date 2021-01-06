/// @description Initialize
path = path_add();
path_set_kind(path, 2); // 2 = linear, 1 = curved
path_set_closed(path, false);
pathSpeed = 8;

state = ACTOR_IDLE;
army = BLUE_ARMY;
level = 1;

// TODO:
// --DnD Traits
class = "Peasant";
race = "Human";

profMod = 2 + floor(level/5);
strMod = 0;
dexMod = 0;
conMod = 0;
intMod = 0;
wisMod = 0;


// hit variables
hitDie = 4;
maxHP = hitDie + conMod + ((level - 1) * (ceil((hitDie+1)/2) + conMod));
HP = maxHP;
hitBonus = profMod + strMod;

// attack variables
atkType = ATTACK_TYPE_MELEE;
//optional atkRange if atkType = ATTACK_TYPE_RANGED
atkTarget = noone;
atkTimer = 0;

// damage variables
dmgDie = 4;
dmgBonus = strMod;
dmgType = DAMAGE_TYPE_PIERCING;

// defense variables
AC = 10 + dexMod;

// move and act variables
// move = 6
// actions = 2
canAct = false;

// initiative variables
initiative = dexMod;
// initRoll = 0; <-- do we need this? maybe
// --DnD Traits

// Effect Variables
shake = 0;
shakeMag = 0;