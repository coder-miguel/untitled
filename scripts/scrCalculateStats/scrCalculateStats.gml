// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function calc_class_cleric(actor){
	with(actor){
		hitDie = 8;
		hitBonus = profMod + strMod;
		
		atkType = ATTACK_TYPE_MELEE;
		
		dmgDie = 8;
		dmgBonus = strMod;
		dmgType = DAMAGE_TYPE_BLUNT;
		
		AC = 16;
	}
}
function calc_class_fighter(actor){
	with(actor){
		hitDie = 10;
		hitBonus = profMod + strMod;
		
		atkType = ATTACK_TYPE_MELEE;
		
		dmgDie = 8;
		dmgBonus = strMod;
		dmgType = DAMAGE_TYPE_SLASHING;
		
		AC = 18;
	}
}
function calc_class_rogue(actor){
	with(actor){
		hitDie = 6;
		hitBonus = profMod + dexMod;
		
		atkType = ATTACK_TYPE_RANGED;
		atkRange = 10 * GRID_SIZE;
		
		dmgDie = 4;
		dmgBonus = strMod;
		dmgType = DAMAGE_TYPE_PIERCING;
		
		AC = 10 + dexMod;
	}
}
function calc_class_wizard(actor){
	with(actor){
		hitDie = 4;
		hitBonus = profMod + intMod;
		
		atkType = ATTACK_TYPE_RANGED;
		atkRange = 10 * GRID_SIZE;
		
		dmgDie = 4;
		dmgBonus = strMod;
		dmgType = DAMAGE_TYPE_PIERCING;
		
		AC = 10 + dexMod;
	}
}
function calc_race_dwarf(actor){
	actor.move = 5;
}
function calc_race_elf(actor){
	actor.move = 7;
}
function calc_race_gnome(actor){
	actor.move = 5;
}
function calc_race_human(actor){
	actor.move = 6;
}
function calc_stats(actor){
	with(actor){
		profMod = 2 + floor(level/5);
		switch(string_lower(class)){
			case "cleric":
				calc_class_cleric(id);
				break
			case "fighter":
				calc_class_fighter(id);
				break
			case "rogue":
				calc_class_rogue(id);
				break
			case "wizard":
				calc_class_wizard(id);
				break
		}
		switch(string_lower(race)){
			case "dwarf":
				calc_race_dwarf(id);
				break
			case "elf":
				calc_race_elf(id);
				break
			case "gnome":
				calc_race_gnome(id);
				break
			case "human":
				calc_race_human(id);
				break
		}
		maxHP = hitDie + conMod + ((level - 1) * (ceil((hitDie + 1) / 2) + conMod));
		HP = maxHP;
		actions = 2;
		initiative = dexMod;
	}
}
