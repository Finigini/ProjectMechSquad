/// @description regulate stats

//redulate stats
if hull > maxHull {hull = maxHull};
if hull < 0 {hull = 0};
if shield > maxShield {shield = maxShield};
if shield < 0 {shield = 0};