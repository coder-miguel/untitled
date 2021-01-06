// status o the attack. "miss" "hit" "crit"
status = ATTACK_MISS;

// damage and type
damage = 0;
dmgType = DAMAGE_TYPE_PIERCING;

// who it is targeting
target = noone;

// who made the attack
owner = noone;

// path information
path = path_add();
path_set_closed(path, false);
path_set_kind(path, 2);