name = "Eisley";
class = "Rogue";
race = "Elf";
//profMod = 2 + floor(level/5);
strMod = 0;
dexMod = 3;
conMod = 2;
intMod = 1;
wisMod = 0;

//maxHP = 6 + conMod + ((level - 1) * (4 + conMod));
//HP = maxHP;
//
//hitBonus = profMod + dexMod;
//atkType = ATTACK_TYPE_RANGED;
//atkRange = 15 * GRID_SIZE;
//
//move = 7;
//actions = 2;
//
//initiative = dexMod;
//initRoll = 0;
calc_stats(id);

//skills
ds_map_add(skills, "sneak attack", 6);