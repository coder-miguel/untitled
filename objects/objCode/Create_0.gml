/// @description Define macros
#macro GRID_SIZE 32
// Global error
//#macro STATE_ERROR "error"
// Game States
#macro GAME_INITIALIZING "initializing"
#macro GAME_ROLL_INIT "roll initiative"
#macro GAME_READY "ready"
//#macro GAME_ERROR "game error"
// Actor States
#macro ACTOR_IDLE "idle"
#macro ACTOR_PATH_BEGIN "begin path"
#macro ACTOR_MOVING "moving"
#macro ACTOR_ATTACK_BEGIN "begin attack"
#macro ACTOR_ATTACKING "attack"
#macro ACTOR_ATTACK_END "end attack"
#macro ACTOR_READY "ready"
//#macro ACTOR_ERROR "actor error"
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

// Notes:
// Object Depth
// Cursor         -4
// Font/Particals -3
// Projectiles    -2
// Other          -1
#macro DEPTH_CURSOR     -5
#macro DEPTH_FONT       -4
#macro DEPTH_PARTICAL   -3
#macro DEPTH_PROJECTILE -2