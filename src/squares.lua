-- power squares
g_cur_enemy_timer = nil, 0
g_money = 300

function add_money(amount)
   g_money = min(g_money + amount, 999)
end

function remove_money(amount)
   if g_money - amount >= 0 then
      g_money -= amount
      return true
   end
end

function get_money_str()
   local new_str = '00'..g_money
   return sub(new_str, #new_str-2, #new_str)
end

function energy_update(amount)
   if g_energy_tired and g_energy >= 100 then
      g_energy_tired = false
   end

   if g_energy_amount > 0 then
      g_energy_amount = max(0, g_energy_amount-1)
      g_energy = g_energy - 1
   elseif not g_energy_pause then
      g_energy = min(g_max_energy, g_energy + amount)
   end

   if g_energy <= 0 then
      g_energy_tired = true
   end

   g_energy_pause = false
end

function pause_energy()
   g_energy_pause = true
end

g_max_energy, g_energy, g_energy_tired, g_energy_amount, g_energy_stop = 100, 100, false, 0, false
function use_energy(amount)
   g_energy_amount += amount
end
