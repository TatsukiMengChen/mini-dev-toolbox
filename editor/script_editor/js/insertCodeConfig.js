// 换行符
const lineBreak = '\n';
const twoLineBreak = lineBreak.repeat(2);

// 插入的代码串配置表
const insertCodeConfig = {
  'script-玩家黑名单':`black_list={}--在此输入黑名单玩家迷你号，多个迷你号可用","隔开
  function onPlayerEnter(e)
    player_id=e["eventobjid"]
    for i=1,#black_list do
      if player_id==black_list[i] then
        Game:msgBox("您处于此地图黑名单，无法游戏")
        World:despawnActor(player_id)
      end
     end
  end
  ScriptSupportEvent:registerEvent([=[Game.AnyPlayer.EnterGame]=],onPlayerEnter)`,
  'script-连锁挖掘': `ore={400,401,402,403,404,405,406,407,445,446,451,452,453,454,455,598,}
tree1,tree2,tree3,tree4,tree5,tree6,tree7,tree8={200,332,333,218},{201,334,335,219},{254,340,341,255},{202,342,343,220},{205,338,339,223},{203},{204},{579}
tree={tree1,tree2,tree3,tree4,tree5,tree6,tree7,tree8}
function chain(event)
  x,y,z,id = event.x,event.y,event.z,event.blockid
  result,id1 = Block:getBlockID(x+1,y,z)
  result,id2 = Block:getBlockID(x-1,y,z)
  result,id3 = Block:getBlockID(x,y+1,z)
  result,id4 = Block:getBlockID(x,y-1,z)
  result,id5 = Block:getBlockID(x,y,z+1)
  result,id6 = Block:getBlockID(x,y,z-1)
  if id >=400 and id <=598 then--矿物模块
    for i = 1,#ore do
      if id == ore[i] then
        if id1 == id then
          Block:destroyBlock(x+1,y,z,true)
        end
        if id2 == id then
          Block:destroyBlock(x-1,y,z,true)
        end
        if id3 == id then
          Block:destroyBlock(x,y+1,z,true)
        end
        if id4 == id then
          Block:destroyBlock(x,y-1,z,true)
        end
        if id5 == id then
          Block:destroyBlock(x,y,z+1,true)
        end
        if id6 == id then
          Block:destroyBlock(x,y,z-1,true)
        end
        return
      end
    end
  end

  if (id >=200 and id <= 343) or id == 579 then--树模块
    b = 0
    for i = 1,#tree do
      for a =1,3 do
        if id == tree[i][a] then
          b = i
          break
        end
      end
      if b ~= 0 then
        break
      end
    end
    if b ~= 0 then
      for i = 1,#tree[b] do
        if id == tree[b][i] then
          for a = 1,3 do
            c = tree[b][a]
            if id1 == c then
              Block:destroyBlock(x+1,y,z,true)
              id1 = true
            end
            if id2 == c then
              Block:destroyBlock(x-1,y,z,true)
              id2 = true
            end
            if id3 == c then
              Block:destroyBlock(x,y+1,z,true)
              id3 = true
            end
            if id4 == c then
              Block:destroyBlock(x,y-1,z,true)
              id4 = true
            end
            if id5 == c then
              Block:destroyBlock(x,y,z+1,true)
              id5 = true
            end
            if id6 == c then
              Block:destroyBlock(x,y,z-1,true)
              id6 = true
            end
          end
          if id1 == true or id2 == true or id3 == true or id4 == true or id5 == true or id6 == true then
            return
          end
        end
      end
    end
  end
end
ScriptSupportEvent:registerEvent([=[Block.Remove]=],chain)`,
  'script-连锁砍树': `--连锁砍树2.0 2021/07/04/00:00 原作者Tatsuki丶梦辰 迷你号158087577
  local dropitem=true
  local function chain(event)
    local x,y,z,blockid=event.x,event.y,event.z,event.blockid
    local result1,id1=Block:getBlockID(x+1,y,z)
    local result2,id2=Block:getBlockID(x-1,y,z)
    local result3,id3=Block:getBlockID(x,y+1,z)
    local result4,id4=Block:getBlockID(x,y-1,z)
    local result5,id5=Block:getBlockID(x,y,z+1)
    local result6,id6=Block:getBlockID(x,y,z-1)
    if blockid~=218 and blockid~=324 then
      if id1==200 or id1==201 or id1==202 or id1==203 or id1==204 or id1==205 or id1==254 or id1==257 and id1==blockid then Block:destroyBlock(x+1,y,z,dropitem) end
      if id2==200 or id2==201 or id2==202 or id2==203 or id2==204 or id2==205 or id2==254 or id2==257 and id2==blockid then Block:destroyBlock(x-1,y,z,dropitem) end
      if id3==200 or id3==201 or id3==202 or id3==203 or id3==204 or id3==205 or id3==254 or id3==257 and id3==blockid then Block:destroyBlock(x,y+1,z,dropitem) end
      if id4==200 or id4==201 or id4==202 or id4==203 or id4==204 or id4==205 or id4==254 or id4==257 and id4==blockid then Block:destroyBlock(x,y-1,z,dropitem) end
      if id5==200 or id5==201 or id5==202 or id5==203 or id5==204 or id5==205 or id5==254 or id5==257 and id5==blockid then Block:destroyBlock(x,y,z+1,dropitem) end
      if id6==200 or id6==201 or id6==202 or id6==203 or id6==204 or id6==205 or id6==254 or id6==257 and id6==blockid then Block:destroyBlock(x,y,z-1,dropitem) end
      if id1==332 or id1==333 then Block:destroyBlock(x+1,y,z,dropitem) end
      if id2==332 or id2==333 then Block:destroyBlock(x-1,y,z,dropitem) end
      if id3==332 or id3==333 then Block:destroyBlock(x,y+1,z,dropitem) end
      if id4==332 or id4==333 then Block:destroyBlock(x,y-1,z,dropitem) end
      if id5==332 or id5==333 then Block:destroyBlock(x,y,z+1,dropitem) end
      if id6==332 or id6==333 then Block:destroyBlock(x,y,z-1,dropitem) end
      --数据54617473756b694e3668a68fb031353830383735373733323234383135313836
    end
  end
  ScriptSupportEvent:registerEvent('Block.Remove',function(event)
    local result, error_string = pcall(chain, event)
    if result==false then
      Chat:sendSystemMsg('#R连锁砍树/脚本错误：'..error_string)
      error('#R连锁砍树/脚本错误：'..error_string)
    end
  end)`,
  'event-example': `ScriptSupportEvent:registerEvent([=[eventname]=],name)`,
  'variable-global': `a = 1${lineBreak}`,
  'variable-local': `local a = 1${lineBreak}`,
  'func-global': `function a()${twoLineBreak}end${lineBreak}`,
  'func-local': `local function a()${twoLineBreak}end${lineBreak}`,
  'assert-if': `if true then${twoLineBreak}else${twoLineBreak}end${lineBreak}`,
  'assert-ifelse': `if true then${twoLineBreak}end${lineBreak}`,
  'assert-ifelseif': `if true then${twoLineBreak}elseif true then${twoLineBreak}else${twoLineBreak}end${lineBreak}`,
  'loop-for': `for i=0, 10 do${twoLineBreak}end${lineBreak}`,
  'loop-while': `val=0${twoLineBreak}while val<5 do${twoLineBreak}val=val+1${twoLineBreak}end${lineBreak}`,
  'loop-repeatUntil': `val=0${twoLineBreak}repeat${twoLineBreak}val=val+1${twoLineBreak}until(val>5)${lineBreak}`,
  'table-global': `a = {}${lineBreak}`,
  'table-local': `local a = {}${lineBreak}`,
};

window.insertCodeConfig = insertCodeConfig;
