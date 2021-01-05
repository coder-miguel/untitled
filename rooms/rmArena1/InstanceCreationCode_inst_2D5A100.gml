class = "Wizard";
race = "Gnome";
profMod = 2 + floor(level/5);
strMod = 0;
dexMod = 1;
conMod = 2;
intMod = 3;
wisMod = 0;

maxHP = 4 + conMod + ((level - 1) * (3 + conMod));
HP = maxHP;

hitBonus = profMod + strMod;

initiative = dexMod;

move = 5;