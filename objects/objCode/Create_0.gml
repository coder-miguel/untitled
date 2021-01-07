/// @description Define macros
#macro GRID_SIZE 32
// Global error
//#macro STATE_ERROR "error"
// Game States
#macro GAME_INITIALIZING "game initializing"
#macro GAME_ROLL_INIT "game roll initiative"
#macro GAME_READY "game ready"
//#macro GAME_ERROR "game error"
// Actor States
#macro ACTOR_IDLE "actor idle"
#macro ACTOR_PATH_BEGIN "actor begin path"
#macro ACTOR_MOVING "actor moving"
#macro ACTOR_ATTACK_BEGIN "actor begin attack"
#macro ACTOR_ATTACKING "actor attack"
#macro ACTOR_ATTACK_END "actor end attack"
#macro ACTOR_ACTION_BEGIN "actor begin action"
#macro ACTOR_ACTION_ACT "actor act action"
#macro ACTOR_ACTION_END "actor end action"
#macro ACTOR_TURN_END "actor end turn"
//#macro ACTOR_READY "ready"
//#macro ACTOR_ERROR "actor error"
// Actions
#macro ACT_END_TURN "End Turn"
// Terrain Types
#macro TER_WALL "wall"
#macro TER_RUBBLE "rubble"
#macro TER_HOLE "hole"
// Node Types
#macro NODE_DEFAULT "node"
//#macro NODE_ERROR "node error"
#macro RED_ARMY 10
#macro BLUE_ARMY 20
// Attack States
#macro ATTACK_HIT "hit"
#macro ATTACK_MISS "miss"
#macro ATTACK_CRIT "crit"
// Attack Types
#macro ATTACK_TYPE_MELEE "melee"
#macro ATTACK_TYPE_RANGED "ranged"
// Damage Types
#macro DAMAGE_TYPE_PIERCING "piercing"
#macro DAMAGE_TYPE_BLUNT "blunt"
#macro DAMAGE_TYPE_SLASHING "slashing"

// Timing
#macro TIME_ATTACK 10

// Layering
#macro DEPTH_CURSOR     -6
#macro DEPTH_BUTTON     -5
#macro DEPTH_FONT       -4
#macro DEPTH_PARTICAL   -3
#macro DEPTH_PROJECTILE -3
#macro DEPTH_SELECTOR   -2