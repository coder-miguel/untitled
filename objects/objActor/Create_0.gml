/// @description Initialize
path = path_add();
path_set_kind(path, 2);
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

maxHP = 4 + conMod + ((level - 1) * (3 + conMod));
HP = maxHP;

hitBonus = profMod + strMod;

initiative = dexMod;
initRoll = 0;
// --DnD Traits