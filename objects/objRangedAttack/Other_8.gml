if(status != ATTACK_MISS){
	target.HP -= damage;
	
	// Damage Biff Animation
	for(var ii = 0; ii < 6; ii++){
		with(instance_create_depth(target.x, target.y, DEPTH_PARTICAL, objBiff)){
			direction = irandom(360);
			speed = irandom_range(2, 4);
			scale = choose(2, 3);
		
			image_speed = 0.5;
			if(other.status == ATTACK_CRIT){
				color = c_yellow;
			}
		}
	}
	// Damage Text
	with(instance_create_depth(target.x + 28, target.y + 2, DEPTH_FONT, objDmgText)){
		text = "-" + string(other.damage);
		ground = y;
		if(other.status == ATTACK_CRIT){
			font = fntCrit;
		}
	}
	if(status == ATTACK_CRIT){
		target.shake = 8;
		target.shakeMag = 8;
	}else{
		target.shake = 4;
		target.shakeMag = 4;
	}
}else{
	with(instance_create_depth(target.x + 28, target.y + 2, DEPTH_FONT, objDmgText)){
		text = "MISS";
		ground = y;
	}
}

instance_destroy();
