/// @description switch state of actor

switch(state){
	case ACTOR_BEGIN_PATH:
		//begin moving along path
		path_start(path, pathSpeed, 0, false); // set to true if errors
		state = ACTOR_MOVING;
		break;
}