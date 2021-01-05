class = "Fighter";
race = "Dwarf";
profMod = 2 + floor(level/5);
strMod = 3;
dexMod = 0;
conMod = 2;
intMod = 0;
wisMod = 1;

maxHP = 10 + conMod + ((level - 1) * (6 + conMod));
HP = maxHP;

hitBonus = profMod + strMod;

initiative = dexMod;

move = 5;