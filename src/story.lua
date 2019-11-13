function map_init()
   g_rooms = gun_vals([[
      'village'={ c=3, qx=0, qy=0,
         x = 0,   y = 10,
         w = 24,  h = 10,
         l={'lank_front_yard',11.5,5},
         r={'field',.5,9},
         {'sign',5.5,14.5,{speaker="Sign","Testing sign"},43},
         {'house',4,14.5,'forest_1',4,4},
         {'house',8,13.5,'forest_1',4,4},
         {'house',12,12.5,'forest_1',4,4},
         {'lark',8.5,14.5}
      },
      'lank_front_yard'={ c=3, qx=0, qy=0,
         x = 12,  y = 0,
         w = 12,  h = 10,
         l={'forest_entrance',11.5,5},
         r={'village',.5,7}
      },
      'field'={ c=3, qx=1, qy=1,
         x = 0,   y = 20,
         w = 24,  h = 12,
         l={'village',23.5,7},
         r={'graveyard_entrance',.5,3}
      },
      'graveyard_entrance'={ c=13, qx=3, qy=0,
         x = 0,   y = 0,
         w = 12,  h = 10,
         l={'field',23.5,3},
         r={'graveyard',.5,17},
         {'sign',105.5,4.5,{speaker="Grave","Here lies an old person (probably)."},45}
      },
      'graveyard'={ c=13, qx=1, qy=1,
         x = 0,   y = 0,
         w = 12,  h = 20,
         l={'graveyard_entrance',11.5,7},
         r={'graveyard_end',.5,7}
      },
      'graveyard_end'={ c=13, qx=3, qy=0,
         x = 12,  y = 0,
         w = 12,  h = 10,
         l={'graveyard',11.5,17},
         r={'canyon_start',.5,7}
      },
      'canyon_start'={ c=4, qx=2, qy=0,
         x = 0,   y = 0,
         w = 24,  h = 10,
         l={'graveyard_end',11.5,7},
         u={'canyon_path',4,15.5}
      },
      'canyon_path'={ c=4, qx=1, qy=1,
         x = 24,   y = 8,
         w = 8,    h = 16,
         d={'canyon_start',18,.5},
         u={'canyon_end',6,9.5}
      },
      'canyon_end'={ c=6, qx=1, qy=1,
         x = 12,   y = 0,
         w = 12,   h = 10,
         d={'canyon_path',4,.5}
      },
      'forest_entrance'={ c=3, qx=0, qy=0,
         x = 0,   y = 0,
         w = 12,  h = 10,
         l={'forest_1',11.5,5},
         r={'lank_front_yard',.5,5},
         d={'forest_lost',6,.5}
      },
      'forest_lost'={ c=3, qx=1, qy=0,
         x = 12,  y = 20,
         w = 12,  h = 12,
         u={'forest_entrance',6,9.5},
         r={'lank_front_yard',.5,5}
      },
      'forest_1'={ c=3, qx=1, qy=0,
         x = 0,   y = 0,
         w = 12,  h = 10,
         r={'forest_entrance',.5,5},
         l={'forest_lost',6,6},
         u={'forest_lost',6,6},
         d={'forest_2',6,.5}
      },
      'forest_2'={ c=3, qx=1, qy=0,
         x = 12,  y = 0,
         w = 12,  h = 10,
         u={'forest_1',6,9.5},
         r={'forest_lost',6,6},
         d={'forest_lost',6,6},
         l={'forest_3',11.5,5}
      },
      'forest_3'={ c=3, qx=1, qy=0,
         x = 0,   y = 10,
         w = 12,  h = 10,
         r={'forest_2',.5,5},
         l={'forest_lost',6,6},
         d={'forest_lost',6,6},
         u={'forest_4',6,9.5}
      },
      'forest_4'={ c=3, qx=1, qy=0,
         x = 12,  y = 10,
         w = 12,  h = 10,
         d={'forest_3',6,.5},
         u={'forest_boss',6,11.5},
         l={'forest_lost',6,6},
         r={'forest_lost',6,6}
      },
      'forest_boss'={ c=3, qx=1, qy=0,
         x = 0,   y = 20,
         w = 12,  h = 12,
         r={'forest_treasure',.5,4},
         d={'forest_4',6,.5}
      },
      'forest_treasure'={ c=3, qx=1, qy=0,
         x = 24,  y = 0,
         w = 8,  h = 8,
         l={'forest_boss',11.5,6}
      }
   ]])

   for k, v in pairs(g_rooms) do
      v.i=function()
         batch_call_table(function(att_name, ...) g_att[att_name](...) end, v)
      end
      v.x,v.y = v.x+v.qx*32, v.y+v.qy*32
   end
end
