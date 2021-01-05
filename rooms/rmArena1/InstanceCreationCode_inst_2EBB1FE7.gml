class = "Rogue";
race = "Elf";
profMod = 2 + floor(level/5);
strMod = 0;
dexMod = 3;
conMod = 2;
intMod = 1;
wisMod = 0;

maxHP = 6 + conMod + ((level - 1) * (4 + conMod));
HP = maxHP;

hitBonus = profMod + dexMod;

initiative = dexMod;

move = 7;