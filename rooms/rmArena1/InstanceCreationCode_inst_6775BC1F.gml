class = "Cleric";
race = "Human";
profMod = 2 + floor(level/5);
strMod = 2;
dexMod = 0;
conMod = 1;
intMod = 0;
wisMod = 3;

maxHP = 8 + conMod + ((level - 1) * (5 + conMod));
HP = maxHP;

hitBonus = profMod + strMod;

initiative = dexMod;

move = 6;