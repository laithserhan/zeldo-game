g_att.lark = function(x, y)
   return create_actor([[
      id="lark",
      att={
         name="|lark",
         sind=99,rx=.5,ry=.5,iyy=-2,
         x=@1, y=@2, i=@3, u=@4
      }, par={"confined","spr","wall"}
      ]],x,y, function(a)
         local big_w, text = 6/8, "|lark:heya lank bro, i'm yer biggest fan!"
         batch_call(gen_text_trigger_block, [[
            {@1,0,@2}, {@1,1,@2},
            {@1,2,@2}, {@1,3,@2}
         ]], a, text)
      end, function(a)
         a.xf = a.x-g_pl.x > 0
      end
   )
end

g_att.sign = function(x, y, text, sind)
   return create_actor([[
      id="sign",
      att={
         name="|sign",
         sind=@3,rx=.5,ry=.5,
         x=@1, y=@2, i=@4
      }, par={"confined","spr","wall"}
      ]],x,y,sind,
      function(a)
         a.trig = gen_text_trigger_block(a, 3, text)
      end
   )
end

function gen_text_trigger_block(sign, dir, text)
   return gen_trigger_block_dir(sign, dir, function(a, other)
      if not g_menu_open and g_selected == G_INTERACT then
         g_right_ma_view.follow_act = sign
         sign.outline_color = 2
         if not g_tbox_active and btnp"4" then
            tbox(text)
         end
      else
         sign.outline_color = 1
      end
   end, function(a, other)
      sign.outline_color = 1
   end
   )
end
